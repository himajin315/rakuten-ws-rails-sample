class ItemsearchController < ApplicationController
  def index
    render 'itemsearch/index'
  end

  def search
    keyword = params['keyword']
    httpClient = HTTPClient.new

    @jsonData = nil
    @errorMeg = nil

    begin
      data = httpClient.get_content('https://app.rakuten.co.jp/services/api/IchibaItem/Search/20130805', {
          'applicationId' => '1051519437665746699',
          'affiliateId'   => '11b23e39.373d568a.11b23e3a.912e032a',
          'keyword'       => keyword
      })
      @jsonData = JSON.parse data
      p @jsonData
    rescue HTTPClient::BadResponseError => e
    rescue HTTPClient::TimeoutError => e
    end

    render 'itemsearch/index'
  end
end
