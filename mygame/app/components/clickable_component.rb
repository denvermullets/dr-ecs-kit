class ClickableComponent
  attr_accessor :on_click

  def initialize(&on_click)
    @on_click = on_click || proc { puts 'No defined click action' }
  end
end
