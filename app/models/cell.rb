class Cell < ActiveRecord::Base
  has_many :user_cells
  has_many :users, through: :user_cells
  belongs_to :owner, class_name: "User", foreign_key: :user_id

  has_many :cell_contacts
  has_many :contacts, through: :cell_contacts

  scope :selected, ->{ where(status: 1) }

  enum status: { not: 0, selected: 1 }

  validates :number, uniqueness: { message: "小区编号已经存在" }
end
