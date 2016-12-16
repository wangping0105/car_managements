class Attachment < ActiveRecord::Base
  belongs_to :attachmentable, polymorphic: true
  belongs_to :user

  has_attached_file :file, :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename"
  validates_attachment :file, content_type: { content_type: /.*/ }, :size => { :in => 0..20.megabytes }

  before_save -> { self.name = self.try(:file_name) if self.try(:file_name_changed?)}

  def file_url
    file.try(:url)
  end
end
