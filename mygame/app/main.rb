require 'app/components/sprite_component'
require 'app/components/z_component'
require 'app/components/label_component'
require 'app/components/clickable_component'
require 'app/systems/render_system'
require 'app/systems/input_system'
require 'app/entities/entity'

def tick(args)
  args.labels << { x: 100, y: 100, text: "#{args.inputs.mouse.x} - #{args.inputs.mouse.y}", r: 0, g: 0, b: 0 }
  args.state.entities ||= []
  init(args) if args.state.tick_count.zero?

  args.state.render_system.render_outputs(args)
  args.state.input_system.update(args)
end

def init(args)
  # Create a sprite entity
  entity = Entity.new
  entity.add_component(SpriteComponent, SpriteComponent.new(path: 'sprites/square/blue.png', x: 100, y: 100, w: 50, h: 50))
  entity.add_component(ZComponent, ZComponent.new(z: 1)) # Higher z means rendered later (higher layer)
  entity.add_component(ClickableComponent, ClickableComponent.new)
  entity_two = Entity.new
  entity_two.add_component(SpriteComponent, SpriteComponent.new(path: 'sprites/square/blue.png', x: 120, y: 100, w: 50, h: 50))
  entity_two.add_component(ZComponent, ZComponent.new(z: 0)) # Higher z means rendered later (higher layer)
  args.state.entities << entity
  args.state.entities << entity_two

  # Create a label entity
  label_entity = Entity.new
  label_entity.add_component(LabelComponent, LabelComponent.new(text: "Hello, ECS!", x: 100, y: 150))
  label_entity.add_component(ZComponent, ZComponent.new(z: 0)) # Lower z means rendered earlier

  args.state.render_system = RenderSystem.new(args.state.entities)
  args.state.input_system = InputSystem.new(args.state.entities, args.inputs)
  args.state.entities << label_entity
end
