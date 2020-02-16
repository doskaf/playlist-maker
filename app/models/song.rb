class Song < ApplicationRecord
    validates :title, :artist, presence: true
    has_many :playlist_songs
    has_many :playlists, through: :playlist_songs

    def song_by
        self.title + " - " + self.artist
    end
end