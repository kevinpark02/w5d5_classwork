# == Schema Information
#
# Table name: chirps
#
#  id        :bigint           not null, primary key
#  body      :text             not null
#  author_id :integer          not null
#
class Chirp < ApplicationRecord 
    # validations run when you try to save
    validates :body, presence: true 
    # validates :author_id, presence: true  
    # belongs_to association automatically validates presence of author_id so no need to explicitly validate
    validate :body_too_long # custom validation, need to use validate singular

    # custom validation
    def body_too_long 
        # check if body exists first
        if body && body.length > 140
            errors[:body] << 'is too long. Keep it short please.'
        end
    end

    # associations
    # belongs_to if you hold a foreign key
    belongs_to :author, # what you want to name association
        primary_key: :id, # from other class
        foreign_key: :author_id, # from this class
        class_name: :User # 'User' works as well
    # cannot do one-liner bc foreign key author_id isn't same as class name user

    has_many :likes,
        foreign_key: :chirp_id,
        class_name: :Like 
    
    has_many :likers,
        through: :likes,
        source: :liker 

    #* User Queries:
    ## The following queries are being typed here mainly as a resource for you.

    #? Find all chirps for a particular user
    User.find_by(username: 'like_mike').chirps #two queries

    # one query version
    # User.joins(:chirps).having("username = 'like_mike") having is paried with group
    Chirp.joins(:author).where("username = 'like_mike'").select("chirps.*")

    #? Find all chirps liked by people affiliated with JavaScript
    # unique values version
    Chirp.joins(:likers).where("political_affiliation = 'JavaScript'").distinct

    #? Find all chirps with no likes
    Chirp.left_outer_joins(:likes).where(likes:{ id: nil })

    #? Find the number of likes each chirp has
    Chirp.select(:id, :body, "count(*) AS num_likes").joins(:likes).group(:id)
    Chirp.joins(:likes).group(:id).pluck(:body, "count(*) AS num_likes")

    #? Find chirps with at least 3 likes (try to use pluck)
    Chirp.select(:id, :body, "count(*) AS num_likes").joins(:likes).group(:id).having("count(*) > 2").pluck(:body, "count(*)")
    Chirp.joins(:likes).group(:id).having("count(*) > 2").pluck(:body, "count(*)")
    # what if we also wanted the number of likes?

    #? Find all chirps created by someone age 99 that were also liked by someone age 99
    Chirp.joins(:likers, :author).where(users: { age: 99 } ).where(authors_chirps: { age: 99 } )

    #* Includes example

    def self.see_chirp_authors_n_plus_one
        # the "+1"
        chirps = Chirp.all

        # the "N"
        chirps.each do |chirp|
            puts chirp.author.username
        end

    end

    def self.see_chirps_optimized
        # pre-fetches data
        chirps = Chirp.includes(:author).all

        chirps.each do |chirp| 
        # uses pre-fetched data 
            puts chirp.author.username
        end
    end

    #*  Joins example

    def self.see_chirp_num_likes_n_plus_one
        chirps = Chirp.all

        chirps.each do |chirp|
            puts chirp.likes.length
        end
    end

    def self.see_chirp_num_likes_optimized
        chirps_with_likes = Chirp
            .select("chirps.*, COUNT(*) AS num_likes")
            .joins(:likes)
            .group(:id)
    
        chirps_with_likes.each do |chirp|
            puts chirp.num_likes
        end
    end


end
