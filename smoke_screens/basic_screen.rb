require 'open-uri'

module SmokeScreens
  class BasicScreen
    def valid?
      request_data(load_content: false)

      status?
    end

    def host
      SmokeScreens::host
    end

    def path
      raise 'implement me'
    end

    def last_request_url
      @last_request_url
    end

    def content
      @content || ''
    end

    def status
      @status.to_i
    end

    def status?
      status.between?(200, 300)
    end

    protected

    def request_data(load_content: true, content_url: nil)
      @last_request_url = content_url || url

      if @last_request_url && @last_request_url.length > 0
        res = open(@last_request_url)

        @status =
          (res.status.is_a?(Array) ? res.status.first : res.status)

        (@content = res.read) if load_content
      else
        @status = nil
        @content = nil
      end
    end

    def attach_host(path_part)
      "#{host if path_part !~ URL_HEADER_PATTERN}#{path_part}"
    end

    def url
      attach_host(path)
    end
  end
end