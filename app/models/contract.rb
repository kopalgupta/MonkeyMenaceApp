class Contract < ActiveRecord::Base
  belongs_to :complaint
  belongs_to :official
  belongs_to :catcher
end
