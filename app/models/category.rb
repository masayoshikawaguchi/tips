class Category < ApplicationRecord
    validates :content, presence: true, length: { maximum: 50 }
    
    has_many :microposts
end
