class Post < Entry
  content_attr :body, :text

  validates :body, presence: true
end
