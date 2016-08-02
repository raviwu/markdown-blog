class Ebook < Entry
  paginates_per Settings.content.show_number_on_index
  has_many :attachments, class_name: 'Attachment', foreign_key: 'entry_id', dependent: :destroy
  has_one :image, class_name: 'Image', foreign_key: 'entry_id', dependent: :destroy
  content_attr :introduction, :text

  validates :introduction, presence: true
end
