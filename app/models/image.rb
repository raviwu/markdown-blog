class Image < ActiveRecord::Base
  belongs_to :entry

  has_attached_file :asset, styles: { medium: "300x300>", small: "200x200>",thumb: "100x100>" }
  validates_attachment_content_type :asset, content_type: /\Aimage\/.*\Z/
end
