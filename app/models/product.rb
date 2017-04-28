class Product < ApplicationRecord
	has_many :orders

	def self.search(search_term)
		Product.where("name Like ?", "%#{search_term}%")
	end
end

