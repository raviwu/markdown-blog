class Entry < ActiveRecord::Base
  belongs_to :user
  scope :published, -> { where('published_at <= ?', Time.current).order('created_at DESC') }

  before_validation :get_slug, :get_author_name, :get_published_at

  validates :title, presence: true

  def to_param
    slug
  end

  protected

  def self.content_attr(attr_name, attr_type = :string)
    content_attributes[attr_name] = attr_type

    define_method(attr_name) do
      self.payload ||= {}
      self.payload[attr_name] || self.payload[attr_name.to_s]
    end

    define_method("#{attr_name}=".to_sym) do |value|
      self.payload ||= {}
      self.payload[attr_name] = value
    end
  end

  def self.content_attributes
    @content_attributes ||= {}
  end

  def get_slug
    default_slug = title.downcase.strip.gsub(" ", "-")
    assign_slug = slug.present? ? slug : default_slug

    while self.class.where(slug: assign_slug).present? && self.class.where(slug: assign_slug).count > 1
      assign_slug = "#{default_slug}-#{SecureRandom.random_number(99999)}"
    end

    self.slug = assign_slug
  end

  def get_published_at
    self.published_at ||= Time.current
  end

  def get_author_name
    self.author_name ||= self.user.username
  end
end
