require 'chatterbot/dsl'

secrets = File.exists?("sophistwee.yml") ? YAML.load_file("sophistwee.yml") : ENV

HashWithIndifferentAccess.new(secrets).tap do |s|
  consumer_key s.fetch(:consumer_key)
  consumer_secret s.fetch(:consumer_secret)
  secret s.fetch(:access_token_secret)
  token s.fetch(:access_token)
end

module TwitterShell
  class << self
    def method_missing method, *args
      send method, *args
    end
    
    def puts(str)
      retries ||= 0
      tweet(str.strip) ? p(retries) : raise('Garbage')
    rescue
      retries += 1
      retry
    end
  end
end