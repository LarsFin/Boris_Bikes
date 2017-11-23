class Garage
  attr_reader :storage

  def storage= items
    @storage = items
    items = []
  end

  def fix_item(item)
    item.working = true
  end
  
end
