class Complaint < ActiveRecord::Base
  belongs_to :user
  belongs_to :official
  has_many :contract
  after_initialize :set_defaults

  def set_defaults
    self.status = 0 if self.new_record?
    self.resolved = false if self.new_record?
    self.official_id = 0 if self.new_record?
  end

  def self.search(search)
		# for search form
		where("location LIKE ?", "%#{search}%")
	end
end
