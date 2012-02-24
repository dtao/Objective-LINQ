class Type
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def reference?
    true
  end

  def prefix
    ""
  end

  def friendly_name
    @name
  end

  def declare(var = "")
    if reference?
      "#{prefix}#{name} *#{var}"
    else
      "#{prefix}#{name} #{var}"
    end
  end

  def declare_boxed(var = "")
    declare(var)
  end

  def box(var)
    var
  end

  def unbox(var)
    var
  end
end