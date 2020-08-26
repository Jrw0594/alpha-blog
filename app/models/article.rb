class Article < ApplicationRecord
    belongs_to :user
    #this will make sure title is present to be saved
    validates :title, presence: true, length: {minimum: 6, maximum:100}
    validates :description, presence: true, length: {minimum:10, maximum: 300}
end