class ListProduct < ActiveRecord::Base
  include ActiveUUID::UUID
  
  belongs_to :list
  belongs_to :product
end
