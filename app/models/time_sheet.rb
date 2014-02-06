class TimeSheet < ActiveRecord::Base
  serialize :logged_hours
  belongs_to :user
end
