class Complaint < ActiveRecord::Base
  belongs_to :user
  belongs_to :official
  has_one :contract

  def self.search(search)
		# for search form
		where("location LIKE ?", "%#{search}%")
	end
end
