class InputSystem
  def initialize(entities, inputs)
    @entities = entities
    @inputs = inputs
  end

  def update(args)
    @entities = args.state.entity_manager.entities
    @inputs = args.inputs
    return unless @inputs.mouse.click

    @entities.each do |entity|
      next unless entity.component?(SpriteComponent) && entity.component?(ClickableComponent)

      sprite = entity.get_component(SpriteComponent)
      next unless within_bounds?(@inputs.mouse.x, @inputs.mouse.y, sprite)

      puts 'Entity with Sprite clicked!'

      handle_click(entity)
    end
  end

  def within_bounds?(mouse_x, mouse_y, sprite)
    mouse_x >= sprite.x && mouse_x <= sprite.x + sprite.w &&
      mouse_y >= sprite.y && mouse_y <= sprite.y + sprite.h
  end

  def handle_click(entity)
    clickable = entity.get_component(ClickableComponent)
    clickable.on_click.call(entity)
  end
end
