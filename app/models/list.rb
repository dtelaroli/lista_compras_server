class List < ActiveRecord::Base
  belongs_to :user
  has_many :lists_products, dependent: :destroy
end
