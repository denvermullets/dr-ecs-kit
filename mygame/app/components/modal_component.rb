class ModalComponent
  attr_accessor :visible, :buttons

  def initialize(visible: false)
    @visible = visible
    @buttons = []
  end

  def add_button(button_entity)
    @buttons << button_entity
  end

  def toggle
    @visible = !@visible
  end
end
