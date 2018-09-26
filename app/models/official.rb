class Official < ActiveRecord::Base
	has_many :complaints
	has_many :contracts
end
