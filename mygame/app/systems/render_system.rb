# this system will sort labels and sprites by zIndex and then render them
# sprites render first, then labels

class RenderSystem
  def initialize(entities)
    @entities = entities
  end

  def render_outputs(args)
    render_sprites(args)
    render_labels(args)
  end

  private

  def render_sprites(args)
    sort_sprites.each do |entity|
      if entity.component?(ModalComponent)
        modal = entity.get_component(ModalComponent)
        next unless modal.visible
      end

      sprite = entity.get_component(SpriteComponent)
      args.outputs.sprites << { x: sprite.x, y: sprite.y, w: sprite.w, h: sprite.h, path: sprite.path }
    end
  end

  def render_labels(args)
    sort_labels.each do |entity|
      label = entity.get_component(LabelComponent)
      args.outputs.labels << {
        x: label.x,
        y: label.y,
        text: label.text,
        size_enum: label.size,
        r: label.r,
        g: label.g,
        b: label.b,
        a: label.a
      }
    end
  end

  def sort_sprites
    sprite_entities = @entities.select { |entity| entity.component?(SpriteComponent) }

    # Sort both by z-index, or default to 0 if ZComponent is missing
    sprite_entities.sort_by do |entity|
      entity.component?(ZComponent) ? entity.get_component(ZComponent).z : 0
    end
  end

  def sort_labels
    label_entities = @entities.select { |entity| entity.component?(LabelComponent) }

    label_entities.sort_by do |entity|
      entity.component?(ZComponent) ? entity.get_component(ZComponent).z : 0
    end
  end
end
