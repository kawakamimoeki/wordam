require 'uri'
require 'net/http'

module Wikipedia
  class Fetcher
    ENDPOINT = 'https://ja.wikipedia.org/w/api.php'

    def initialize(options)
      @options = options
    end

    def call
      uri = URI(ENDPOINT)
      uri.query = @options.map { |k, v| "#{k}=#{v}" }.join('&')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri)
      http.request(request).body
    end
  end
end
