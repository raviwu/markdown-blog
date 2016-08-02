class Post < Entry
  paginates_per Settings.content.show_number_on_index
  content_attr :body, :text
  has_many :images, class_name: 'Image', foreign_key: 'entry_id', dependent: :destroy

  validates :body, presence: true
end
