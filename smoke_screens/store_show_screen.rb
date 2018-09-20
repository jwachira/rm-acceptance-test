require_relative 'basic_show_screen'
require_relative 'stores_screen'

module SmokeScreens
  class StoreShowScreen < BasicShowScreen
    def parent_page_url
      ::SmokeScreens::StoresScreen.new.url
    end

    def item_url_selector
      '.prodctShop .singlePrdct'
    end
  end
end