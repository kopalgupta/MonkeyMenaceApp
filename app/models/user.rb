class User < ActiveRecord::Base
	has_many :complaints
end
