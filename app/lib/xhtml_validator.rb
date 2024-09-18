require 'open-uri'
require 'nokogiri'

class XhtmlValidator
  def self.validate(url)
    begin
      html_content = URI.open(url).read

      document = Nokogiri::XML(html_content) do |config|
        config.strict.nonet
      end

      if document.errors.empty?
        return "The document is valid XHTML."
      else
        return "XHTML validation errors found: #{document.errors.join(', ')}"
      end

    rescue OpenURI::HTTPError => e
      return "Error fetching the URL: #{e.message}"
    rescue => e
      return "Error during validation: #{e.message}"
    end
  end
end




