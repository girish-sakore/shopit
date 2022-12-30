class Category::Category < ApplicationRecord
    self.table_name = 'categories'
    has_many :products
end
