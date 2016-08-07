class Post < Entry
  include PgSearch
  multisearchable against: [:title, :payload]
  pg_search_scope :full_text_search, against: [:title, :payload]

  paginates_per Settings.content.show_number_on_index
  content_attr :body, :text
  has_many :images, class_name: 'Image', foreign_key: 'entry_id', dependent: :destroy

  validates :body, presence: true

  def self.search(query)
    pg_search_result_ids = self.full_text_search(query).ids
    sql_like_result_ids =
      query.split.inject(self.all.ids) do |result, query|
        result & self.where("payload ->> 'body' LIKE ?", "%#{query}%").ids
      end
    result_ids = pg_search_result_ids + sql_like_result_ids
    self.where("id IN (?)", result_ids)
  end
end
