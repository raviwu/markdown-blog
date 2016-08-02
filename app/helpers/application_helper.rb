require 'rouge/plugins/redcarpet'

module ApplicationHelper
  def spaced_divider
    "&nbsp;".html_safe
  end

  def show_content(text, options = {})
    options[:is_index] == true ? brief_content(text) : complete_content(text)
  end

  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  def markdown(text)
    render_options = {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow' },
      prettify: true,
      line_format: '%i'
    }
    @renderer ||= HTML.new(render_options)

    extensions = {
      autolink: true,
      space_after_headers: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      lax_spacing: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true,
      tables: true,
      quote: true,
      no_images: false,
      footnotes: true,
      highlight: true
    }

    @markdown ||= Redcarpet::Markdown.new(@renderer, extensions)
    @markdown.render(text).html_safe
  end

  def postpend_icon_to_link_to(display_string, url, icon_name)
    link_to url do
      "#{display_string} #{fa_icon(icon_name)} ".html_safe
    end
  end

  def prepend_icon_to_link_to(display_string, url, icon_name)
    link_to url do
      "#{fa_icon(icon_name)} #{display_string} ".html_safe
    end
  end

  def postpend_icon_to_string(display_string, icon_name)
    "#{display_string} #{fa_icon(icon_name)} ".html_safe
  end

  def prepend_icon_to_string(display_string, icon_name)
    "#{fa_icon(icon_name)} #{display_string} ".html_safe
  end

  private

  def brief_content(text)
    text.split(Settings.content.readmore_tag).first
  end

  def complete_content(text)
    text.gsub(Settings.content.readmore_tag, "")
  end
end
