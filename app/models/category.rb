class Category < ApplicationRecord
    validates_presence_of :name
    has_many :playlists
    has_many :users, through: :playlists
end