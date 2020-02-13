class Playlist < ApplicationRecord
    validates_presence_of :name
    has_many :playlist_songs
    has_many :songs, through: :playlist_songs
    belongs_to :category
    belongs_to :user
end