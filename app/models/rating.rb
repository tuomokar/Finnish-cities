class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  scope :commented, ->  {where.not comment:nil and where.not comment:"" }

  validates :points, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 5,
                                    only_integer: true, message: :points_must_be_between_1_and_5}
end
