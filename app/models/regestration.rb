class Regestration < ApplicationRecord
  belongs_to :event
  validates :name, presence: true
  validates :email, format: { with: /\S+@\S+/ }
  HOW_HEARD_OPTIONS = [
    'fecebook',
    'blog',
    'instagram',
    'friend/coworker',
    'Other'
  ]
  validates :how_heard,inclusion: { in: HOW_HEARD_OPTIONS }
end
