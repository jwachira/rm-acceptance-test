require_relative 'basic_screen'

module SmokeScreens
  URL_HEADER_PATTERN = %r(https?://).freeze
  BASE_URL = 'https://www.rebelsmarket.com'.freeze

  def self.list
    ObjectSpace.each_object(Class).select do |klass|
      klass < ::SmokeScreens::BasicScreen && klass.name != 'SmokeScreens::BasicShowScreen'
    end
  end

  def self.host=(new_host)
    @host = new_host
  end

  def self.host
    @host || BASE_URL
  end
end

Dir["#{File.dirname(__FILE__)}/*.rb"].each do |f|
  unless f.end_with?('smoke_screens.rb')
    require(f)
  end
end
