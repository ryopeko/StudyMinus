class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity_type

  validates_presence_of :user_id, :activity_type_id
end
