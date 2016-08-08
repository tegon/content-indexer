require 'open-uri'

class Crawler
  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def document
    @document ||= Nokogiri::HTML(open(url))
  end

  def links
    document.css('a').map do |link|
      { href: link.attr('href') }
    end
  end

  def tags
    %w(h1 h2 h3).map do |tag|
      document.css(tag).map do |tag_html|
        { type: tag, content: tag_html.text }
      end
    end.flatten
  end
end
