# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  liker_id   :integer          not null
#  chirp_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
    validates :liker_id, :chirp_id, presence: true 

    belongs_to :liker,
        primary_key: :id,
        foreign_key: :liker_id,
        class_name: :User 

    # belongs_to :chirp,
    #     foreign_key: :chirp_id,
    #     class_name: :Chirp 
        # can leave off primary_key bc always id

    belongs_to :chirp # one-liner
    # can do this bc foreign key is chirp_id which is same as class Chirp

end
