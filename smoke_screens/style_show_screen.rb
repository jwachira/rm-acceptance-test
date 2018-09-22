require_relative 'basic_show_screen'
require_relative 'styles_screen'

module SmokeScreens
  class StyleShowScreen < BasicShowScreen
    def parent_page_url
      ::SmokeScreens::StylesScreen.new.url
    end

    def item_url_selector
      '.products-columns .category-wrapper'
    end
  end
end