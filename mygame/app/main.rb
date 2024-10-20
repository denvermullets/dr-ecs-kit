require 'app/components/sprite_component'
require 'app/components/z_component'
require 'app/components/label_component'
require 'app/components/clickable_component'
require 'app/components/modal_component'
require 'app/managers/entity_manager'
require 'app/systems/render_system'
require 'app/systems/input_system'
require 'app/entities/entity'
require 'app/entities/modal_menu'
require 'app/entities/button'

def tick(args)
  args.labels << { x: 20, y: 700, text: "#{args.inputs.mouse.x} - #{args.inputs.mouse.y}", r: 0, g: 0, b: 0 }
  init(args) if args.state.tick_count.zero?

  args.state.render_system.render_outputs(args)
  args.state.input_system.update(args)
end

def init(args)
  args.state.entity_manager ||= EntityManager.new

  main_modal = ModalMenu.new.create_modal
  main_modal.each do |entity|
    args.state.entity_manager.add_entity(entity)
  end

  args.state.render_system = RenderSystem.new(args.state.entity_manager.entities)
  args.state.input_system = InputSystem.new(args.state.entity_manager.entities, args.inputs)
end
