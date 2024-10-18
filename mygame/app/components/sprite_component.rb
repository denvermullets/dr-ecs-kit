class SpriteComponent
  attr_accessor :path, :x, :y, :w, :h, :r, :g, :b, :a, :angle

  def initialize(path:, x:, y:, w:, h:, r: 255, g: 255, b: 255, a: 255)
    @path = path
    @x = x
    @y = y
    @w = w
    @h = h
    @r = r
    @g = g
    @b = b
    @a = a
    @angle = 0
  end
end
