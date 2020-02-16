class Playlist < ApplicationRecord
    validates :name, :category_name, presence: true
    has_many :playlist_songs
    has_many :songs, through: :playlist_songs
    belongs_to :category
    belongs_to :user
    accepts_nested_attributes_for :songs

    def category_name=(name)
        self.category = Category.find_or_create_by(name: name)
    end
    
    def category_name
        self.category ? self.category.name : nil
    end

    def self.by_category
        self.includes(:category).order('categories.name')
    end

end