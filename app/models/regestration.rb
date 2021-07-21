class Regestration < ApplicationRecord
  belongs_to :event
  belongs_to :user
 
  HOW_HEARD_OPTIONS = [
    'fecebook',
    'blog',
    'instagram',
    'friend/coworker',
    'Other'
  ]
  validates :how_heard,inclusion: { in: HOW_HEARD_OPTIONS }
end
