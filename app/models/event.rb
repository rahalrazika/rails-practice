class Event < ApplicationRecord
  has_many :regestrations, dependent: :destroy
  validates :name, :location, presence: true
  validates :description, length: { minimum: 10 }
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :image_file_name, format: { 
    with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.'
}

  def self.upcaming
    where('start_at > ?', Time.now).order('start_at')
  end

  def free?
    price.blank? || price.zero?
  end

  def sold_out?
    (capacity - regestrations.size).zero?
  end
end