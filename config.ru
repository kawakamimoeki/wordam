# frozen_string_literal: true

require "bundler/setup"
require "hanami/api"
require_relative "./lib/wordam"

class App < Hanami::API
  get "/" do
    headers["Access-Control-Allow-Origin"] = "*"
    words = Wordam.new({
      rnlimit: params[:limit] || Wordam.default_options[:rnlimit]
    }).words
    json({ words: words })
  end
end

run App.new
