class Store < ApplicationRecord
  has_many :ratings
  validates_presence_of :lonlat, :name, :google_place_id
  validates :google_place_id, uniqueness: true


  scope :within, -> (longitude, latitude, distance_in_km = 5) {
    where(%{
      ST_Distance(lonlat, 'POINT(%f %f)') < %d
    } % [longitude, latitude, distance_in_km * 1000])
  }

  def rating_average
    return 0 if self.ratings.empty?
    # to_i convert para inteiro
    # self.ratings.sum -> soma todos os value do relacionamento ratings do Store curente
    # self.ratings.count -> conta todos os ratings
    (self.ratings.sum(:value) / self.ratings.count).to_i
  end


end
