require_relative '../author'

RSpec.describe Author do
  let(:author) { Author.new('John', 'Doe') }

  describe '#initialize' do
    # ...
  end

  describe '#add_items' do
    it 'adds the item to the author\'s items array' do
      item = double('item')
      expect(item).to receive(:author=).with(author) # Expect the :author= message
      author.add_items(item)
      expect(author.items).to include(item)
    end
  end
end
