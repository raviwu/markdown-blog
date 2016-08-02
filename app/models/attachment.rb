class Attachment < ActiveRecord::Base
  belongs_to :entry

  has_attached_file :asset
  validates_attachment_content_type :asset, content_type: /\Aapplication\/.*\Z/
end
