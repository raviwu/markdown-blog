class Post < Entry
  paginates_per 5
  content_attr :body, :text

  validates :body, presence: true
end
