class Item < ActiveRecord::Base
  validates :description, :price, presence: true
end
