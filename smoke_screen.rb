$LOAD_PATH << './smoke_screens'

require 'smoke_screens'
require 'colorize'

class SmokeScreen
  FAILED = "[ FAILED ]".colorize(:blue).freeze
  PASSED = "[ PASSED ]".colorize(:green).freeze

  def self.run!(new_host: nil)
    STDOUT.sync = true
    response = true

    ::SmokeScreens.host = new_host if new_host

    ::SmokeScreens::list.each do |screen|
      screen_instance = screen.new

      screen_response = screen_instance.valid?

      response &= screen_response

      STDOUT.puts "#{screen_response ? PASSED : FAILED } [#{screen.name}] [#{screen_instance.status}] [#{screen_instance.last_request_url}]"
    end

    response
  end
end

SmokeScreen.run!
