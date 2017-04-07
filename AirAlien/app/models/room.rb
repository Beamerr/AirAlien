class Room < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :reviews

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :home_type, presence: true 
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bed_room, presence: true
  validates :bath_room, presence: true
  validates :listing_name, presence: true, length: {maximum: 50}
  validates :summary, presence: true, length: {maximum: 500}
  validates :address, presence: true
  validates :price, presence: true

  def show_first_photo
    if self.photos.length == 0
      'http://placehold.it/350x150'
    else
      self.photos[0].image.url
    end
  end

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end
end
