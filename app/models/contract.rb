class Contract < ActiveRecord::Base
  belongs_to :complaint
  belongs_to :official
  belongs_to :catcher

  after_initialize :set_defaults

  def set_defaults
    self.status = 0 if self.new_record?
  end

end
