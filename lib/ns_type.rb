require File.join(File.dirname(__FILE__), "type")

class NSType < Type
  class << self
    def all
      if @all.nil?
        @all = %w{String Value Number}.map { |w| NSType.new(w) }
      end

      @all
    end
  end

  def prefix
    "NS"
  end
end