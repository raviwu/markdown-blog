class Post < Entry
  paginates_per Settings.content.show_number_on_index
  content_attr :body, :text

  validates :body, presence: true
end
