class Product < ApplicationRecord
    belongs_to :category, class_name: 'Category::Category'

    validates :name, :price, :description, :category_id, :url, :presence => true
end
