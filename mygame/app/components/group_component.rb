# this is helfpul when you want to group items together, eg: a modal

class GroupComponent
  attr_accessor :group_id

  def initialize(group_id)
    @group_id = group_id
  end
end
