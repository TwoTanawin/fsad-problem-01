require_relative '../../lib/divider'
require_relative '../../lib/fetch_parse_html'
require_relative '../../lib/xhtml_validator'

class MainController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def task1
    if params[:url].present?
      url = params[:url]
      @validation_result = XhtmlValidator.validate(url)
    end
    render 'task1'
  end

  def task2
    if params[:num1].present? && params[:num2].present?
      @num1 = params[:num1].to_f
      @num2 = params[:num2].to_f

      begin
        @result = Divider.new(@num1, @num2).divide
      rescue ZeroDivisionError => e
        @error_message = e.message
      end
    end
    render 'task2'
  end

  def task3
    nyt_url = 'https://www.nytimes.com/section/world'
    nyt_text = '/world/'

    bp_url = 'https://www.bangkokpost.com'
    bp_text = 'bangkokpost.com'

    nyt_fetcher = FetchParseHtml.new(nyt_url, nyt_text)
    @nyt_headlines = nyt_fetcher.fetch

    bp_fetcher = FetchParseHtml.new(bp_url, bp_text)
    @bp_headlines = bp_fetcher.fetch

    render 'task3'
  end
end



