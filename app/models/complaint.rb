class Complaint < ActiveRecord::Base
  belongs_to :user
  belongs_to :official
  has_one :contract
end
