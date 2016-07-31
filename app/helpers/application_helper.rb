require 'rouge/plugins/redcarpet'

module ApplicationHelper
  def spaced_divider
    "&nbsp;".html_safe
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
end
