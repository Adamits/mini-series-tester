module ApplicationHelper
  include CompositionHelper
  def markdown(text)
    options = {
      hard_wrap: true,
      filter_html: true,
      autolink: true,
      no_intra_emphasis: true
    }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    markdown.render(sanitize text, tags: %w(br blockquote >)).html_safe
  end
end
