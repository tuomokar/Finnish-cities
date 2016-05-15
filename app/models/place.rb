class Place < ActiveRecord::Base
  translates :name, :link, :description
  actable

  belongs_to :municipality
  has_many :ratings

  validates :name, :presence => false,
      :uniqueness => { :message => :not_unique },
      :length => { minimum: 2, :message => :place_name_too_short }


  def average_rating
    ratings.any? ? ratings.map{ |r| r.points }.sum / ratings.count.to_f : 0
  end
end

