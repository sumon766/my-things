class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name, id: Random.rand(1..1000))
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_items(item)
    @items << item
    item.author = self
  end
end
