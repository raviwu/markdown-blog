class Post < Entry
  include PgSearch
  multisearchable against: [:title, :payload]
  pg_search_scope :full_text_search, against: [:title, :payload]

  paginates_per Settings.content.show_number_on_index
  content_attr :body, :text
  has_many :images, class_name: 'Image', foreign_key: 'entry_id', dependent: :destroy

  validates :body, presence: true

  def is_public?
    published_at <= Time.current && is_draft == false
  end
end
