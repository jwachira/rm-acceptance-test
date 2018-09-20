require_relative 'basic_show_screen'
require_relative 'collections_screen'

module SmokeScreens
  class CollectionShowScreen < BasicShowScreen
    def parent_page_url
      ::SmokeScreens::CollectionsScreen.new.url
    end

    def item_url_selector
      '.search_grid-page .category-wrapper'
    end
  end
end