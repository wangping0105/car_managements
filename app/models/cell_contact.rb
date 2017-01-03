class CellContact < ActiveRecord::Base
  belongs_to :cell
  belongs_to :contact

  validates :contact_id, uniqueness: {scope: :cell_id, message: "小区只能有一个相同联系人" }
end
