# putting a way to layer sprites, thinking will be helpful with modals
class ZComponent
  attr_accessor :z

  def initialize(z: 0)
    @z = z
  end
end
