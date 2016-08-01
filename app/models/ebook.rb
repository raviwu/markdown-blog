class Ebook < Entry
  paginates_per Settings.content.show_number_on_index
  content_attr :introduction, :text

  validates :introduction, presence: true
end
