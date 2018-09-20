require_relative 'basic_show_screen'
require_relative 'stores_screen'

module SmokeScreens
  class CategoryShowScreen < BasicShowScreen
    def parent_page_url
      ::SmokeScreens::CategoriesScreen.new.url
    end

    def item_url_selector
      '.products-columns .category-wrapper'
    end
  end
end