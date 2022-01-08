require 'json'
require_relative './wikipedia/fecther.rb'

class Wordam
  def initialize(options)
    @options = Wordam.default_options.merge(options)
  end

  def self.default_options
    {
      action: 'query',
      format: 'json',
      list: 'random',
      rnnamespace: 0,
      rnlimit: 100
    }
  end

  def words
    wikipedia = Wikipedia::Fetcher.new(@options).call
    JSON.parse(wikipedia)['query']['random'].map { |a| a['title'] }
  end
end
