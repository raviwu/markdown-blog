class BookIntro < Entry
  content_attr :epub_url, :string
  content_attr :mobi_url, :string
  content_attr :pdf_url, :string
  content_attr :intro, :text

  validates :intro, presence: true
end
