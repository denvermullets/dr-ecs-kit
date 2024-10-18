# main entity for the game
# example usage:
### player_entity = Entity.new
### player_entity.add_component(
###   SpriteComponent, SpriteComponent.new(path: 'sprites/square/blue.png', x: 100, y: 100, w: 50, h: 50))

class Entity
  attr_accessor :components

  def initialize
    @components = {}
  end

  def add_component(type, component)
    @components[type] = component
  end

  def get_component(type)
    @components[type]
  end

  def component?(type)
    @components.key?(type)
  end
end
