require 'open-uri'

class Parser
  class << self

    def valid_json?(json)
      JSON.parse(json)
      true
    rescue Exception
      false
    end

    def get(url)
      Net::HTTP.get(URI.parse(url))
    end

    def get_json(url)
      to_hash get(url)
    rescue Exception => exception
      {error: exception}
    end

    def to_hash(string)
      JSON.parse string
    rescue Exception => exception
      {error: exception}
    end

    def post_json(url, body)
      header = { 'Content-Type': 'text/json' }
      uri = URI.parse(url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      req = Net::HTTP::Post.new(uri.request_uri, header)
      req.body = body.to_json
      res = https.request(req)
      to_hash res.body
    rescue Exception => exception
      {error: exception}
    end

  end
end
