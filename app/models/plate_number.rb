class PlateNumber < ActiveRecord::Base
  belongs_to :car
  belongs_to :contact

  validates :number, uniqueness: { message: "车牌号已经存在" }
end
