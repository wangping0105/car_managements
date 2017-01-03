class Contact < ActiveRecord::Base
  has_many :plate_numbers

  has_many :cell_contacts
  has_many :cell, through: :cell_contacts
end
