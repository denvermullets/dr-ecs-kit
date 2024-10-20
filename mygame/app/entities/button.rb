class Button
  def self.create_button(path:, x:, y:, w:, h:, z: 0, &on_click)
    button_entity = Entity.new
    button_entity.add_component(SpriteComponent, SpriteComponent.new(path: path, x: x, y: y, w: w, h: h))
    button_entity.add_component(ClickableComponent, ClickableComponent.new(&on_click))

    button_entity
  end
end
