require File.join(File.dirname(__FILE__), "type")

class CGType < Type
  class << self
    def all
      if @all.nil?
        @all = %w{Point Size Rect AffineTransform}.map { |w| CGType.new(w) }
      end
    end
  end

  def reference?
    false
  end

  def prefix
    "CG"
  end

  def declare_boxed(var)
    "NSValue *#{var}"
  end

  def box(var)
    "[NSValue valueWithCG#{@name}:#{var}]"
  end

  def unbox(var)
    "[#{var} CG#{@name}Value]"
  end
end