class Artwork < ApplicationRecord
    validates :title , presence: true, uniqueness: {scope: :artist_id, message: 'artist cannot have artwork with the same title' }
    
    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :shared_viewers,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare

    has_many :viewers,
        through: :shared_viewers,
        source: :viewer
end
