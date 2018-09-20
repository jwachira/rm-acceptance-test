require './smoke_screens/basic_screen'
require 'nokogiri'

module SmokeScreens
  class BasicShowScreen < BasicScreen
    def parent_page_url
      raise 'implement me'
    end

    def item_url_selector
      raise 'implement me'
    end

    protected

    def url
      retreive_item_url
    end

    private

    def retreive_item_url
      data = request_data(load_content: true, content_url: attach_host(parent_page_url))

      doc = Nokogiri::HTML(data)

      res = doc.css(item_url_selector)

      res.first['href'] if res && res.length > 0
    end
  end
end