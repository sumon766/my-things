class Genre
    attr_accessor :name, :items

    def initialize(id, name)
        @id = Random.rand(1...1000)
        @name = name
        @items = []
    end

    def add_item(item)
        @item << item
        item.genre = self
    end
end
