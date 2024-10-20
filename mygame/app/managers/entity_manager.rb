class EntityManager
  attr_accessor :entities

  def initialize
    @entities = []
  end

  def find_by_id(id)
    @entities.find { |entity| entity.id == id }
  end

  # maybe we ad a find_by_group_id?

  def add_entity(entity)
    @entities << entity
  end
end
