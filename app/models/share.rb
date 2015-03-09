class Share < ActiveRecord::Base
  include ActiveUUID::UUID
  belongs_to :user
  belongs_to :by, class_name: 'User'
  belongs_to :list
  has_many :list_products, through: :list

  validates :user_id, :by_id, :list_id, presence: true
end
