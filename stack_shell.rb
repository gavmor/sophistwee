module StackShell
  class << self
    def method_missing method, *args
      send method, *args
    end
    
    def puts(str)
      stack.push(str)
    end
    
    def get
      stack.pop
    end
    
    def stack
      @stack ||= []
    end
  end
end