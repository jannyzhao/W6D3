# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :bigint           not null
#
class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :image_url, uniqueness: true

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User,
        inverse_of: :artworks

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        inverse_of: :artworks,
        dependent: :destroy

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    has_many :comments,
        foreign_key: :artwork_id,
        class_name: :Comment,
        inverse_of: :artwork,
        dependent: :destroy
        
#  this line is wrong; fix later
#    has_many :artworks_for_user_id,
#        through: :artwork_shares,
#        source: :artworks
end
