require_relative 'basic_show_screen'

module SmokeScreens
  class ProductShowScreen < BasicShowScreen
    def parent_page_url
      '/widgets/products'
    end

    def item_url_selector
      '.item a'
    end
  end
end