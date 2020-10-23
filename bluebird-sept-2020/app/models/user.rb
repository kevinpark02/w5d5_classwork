# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  age        :integer          not null
#
class User < ApplicationRecord 
    validates :username, :email, :age, presence: true 
    validates :username, :email, uniqueness: true 

    # associations
    has_many :chirps, # what you want to name association
        primary_key: :id, # from this class
        foreign_key: :author_id, # from other class
        class_name: :Chirp # other class
    
    has_many :likes,
        primary_key: :id,
        foreign_key: :liker_id,
        class_name: :Like 
    
    has_many :liked_chirps,
        through: :likes, # must be association name from this class!!
        source: :chirp # must be association name!!


    #* User Queries:
    ## The following queries are being typed here mainly as a resource for you.

    #? Find all instructors between the ages of 90 to 100 inclusive
    User.where("age BETWEEN 90 to 100")

    #? Find all users that are not JavaScript affiliated (use where not)
    User.where.not("political_affiliation = 'JavaScript'")

    #? Find all instructors in this list and order by ascending
    instructors = ["mish_mosh", "wakka_wakka", "jen_ken_intensifies"]
    User.where("username IN (?)", instructors).order("username")
    User.where(username: instructors).order("username") #rails magic


    
end
