require File.join(File.dirname(__FILE__), "type")

class ObjectType < Type
  def initialize
    @name = "id"
  end

  def reference?
    false # but really yeah
  end

  def friendly_name
    "Object"
  end
end