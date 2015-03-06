class List < ActiveRecord::Base
  include ActiveUUID::UUID

  belongs_to :user
  has_many :list_products
end
