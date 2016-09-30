require 'chatterbot/dsl'

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