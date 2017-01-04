class UserCell < ActiveRecord::Base
  belongs_to :user
  belongs_to :cell
end
