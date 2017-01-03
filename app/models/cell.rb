class Cell < ActiveRecord::Base
  belongs_to :user

  has_many :cell_contacts
  has_many :contacts, through: :cell_contacts

  scope :selected, ->{ where(status: 1) }

  enum status: { not: 0, selected: 1 }

  validates :number, uniqueness: { message: "小区编号已经存在" }
end
