require_relative 'basic_show_screen'
require_relative 'premium_home_screen'

module SmokeScreens
  class PremiumProductShowScreen < BasicShowScreen
    def parent_page_url
      ::SmokeScreens::PremiumHomeScreen.new.url
    end

    def item_url_selector
      '.products-columns .listing-card a'
    end
  end
end