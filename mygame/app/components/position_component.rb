# not using for now but if i want to add movement or click and drag maybe
class PositionComponent
  attr_accessor :x, :y

  def initialize(x: 0, y: 0)
    @x = x
    @y = y
  end
end
