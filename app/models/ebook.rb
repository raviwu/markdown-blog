class Ebook < Entry
  paginates_per Settings.content.show_number_on_index
  has_many :attachments, class_name: 'Attachment', foreign_key: 'entry_id', dependent: :destroy
  has_one :image, class_name: 'Image', foreign_key: 'entry_id', dependent: :destroy
  content_attr :introduction, :text
  content_attr :references, :text
  content_attr :pdf_url, :string
  content_attr :epub_url, :string
  content_attr :mobi_url, :string
  content_attr :cover_url, :string

  validates :introduction, presence: true

  def reference_infos
    # description|url,description|url
    references&.strip&.split(",")&.map do |resource|
      {
        url: resource&.split("|")&.last,
        description: resource&.split("|")&.first
      }
    end
  end
end
