class ClickableComponent
  attr_accessor :on_click

  def initialize(&on_click)
    @on_click = on_click
  end
end
