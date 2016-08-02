class Page < Entry
  scope :editor_menu_pages, -> { order("payload ->> 'position' ASC") }
  scope :public_menu_pages, -> { where('published_at <= ? AND is_draft = ?', Time.current, false).order("payload ->> 'position' ASC") }

  paginates_per Settings.content.show_number_on_index
  content_attr :body, :text
  content_attr :position, :integer
  has_many :images, class_name: 'Image', foreign_key: 'entry_id', dependent: :destroy

  validates :body, presence: true
end
