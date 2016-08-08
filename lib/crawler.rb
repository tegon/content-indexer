require 'open-uri'

class Crawler
  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def document
    @document ||= load_url
  end

  def links
    document.css('a').map do |link|
      href = link.attr('href') =~ URI.regexp ? link.attr('href') : "#{url}#{link.attr('href')}"
      { href: href }
    end
  end

  def tags
    %w(h1 h2 h3).map do |tag|
      document.css(tag).map do |tag_html|
        { type: tag, content: tag_html.text }
      end
    end.flatten
  end

  private

  def load_url
    Nokogiri::HTML(open(url)) rescue nil
  end
end
