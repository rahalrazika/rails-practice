class Event < ApplicationRecord
  before_save :set_slug
  has_many :regestrations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :description, length: { minimum: 10 }
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :image_file_name, format: { 
    with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' 
  }


  scope :past, -> { where('start_at < ?', Time.now).order('start_at') }
  scope :upcaming, -> { where('start_at > ?', Time.now).order('start_at')}
  scope :free, -> { where(price: 0.0).order(:name) }
  scope :recent, ->(_max = 3) { past.limit(3) }

  def free?
    price.blank? || price.zero?
  end

  def sold_out?
    (capacity - regestrations.size).zero?
  end

  def to_param
    slug
  end

  def set_slug
    self.slug = name.parameterize
  end
end