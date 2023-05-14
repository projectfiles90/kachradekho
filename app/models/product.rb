class Product < ApplicationRecord
	belongs_to :user
	has_many_attached :images
    # has_many :product_images, dependent: :destroy
    validates :description, presence: true
    validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
    validates :address, presence: true
end
