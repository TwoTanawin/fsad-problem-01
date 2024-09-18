require 'httparty'
require 'nokogiri'

class FetchParseHtml
  def initialize(url, text)
    @url = url
    @text = text
  end

  def fetch
    response = HTTParty.get(@url)
    parse(response.body)
  end

  private

  def parse(html)
    doc = Nokogiri::HTML(html)
    doc.css('a').select { |link| link['href']&.include?(@text) }.map do |link|
      { title: link.text.strip, url: "#{@url}#{link['href']}" }
    end
  end
end
