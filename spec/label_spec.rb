require_relative '../book'
require_relative '../label'

RSpec.describe Label do
  describe "#initialize" do
    it "creates a new label with a title and a color" do
      label = Label.new("Label Title", "Label Color")
      expect(label.title).to eq("Label Title")
      expect(label.color).to eq("Label Color")
    end

    it "creates a new label with a random id between 1 and 1000" do
      label = Label.new("Label Title", "Label Color")
      expect(label.id).to be_between(1, 1000).inclusive
    end

    it "creates a new label with an empty items array" do
      label = Label.new("Label Title", "Label Color")
      expect(label.items).to eq([])
    end
  end

  describe "#add_items" do
    it "adds a new item to the label's items array" do
      label = Label.new("Label Title", "Label Color")
      item = Item.new("Item Title",)
      label.add_items(item)
      expect(label.items).to eq([item])
    end

    it "sets the label of the added item to the current label" do
      label = Label.new("Label Title", "Label Color")
      item = Item.new("Item Title",)
      label.add_items(item)
      expect(item.label).to eq(label)
    end
  end
end
