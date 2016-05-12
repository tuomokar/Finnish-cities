class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  validates :points, numericality: { greater_than_or_equal_to: 1, message: :greater_than_or_equal_to_1,
                                    less_than_or_equal_to: 5,
                                    only_integer: true}
end
