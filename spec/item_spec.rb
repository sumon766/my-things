require_relative '../item'

RSpec.describe Item do
  let(:item) { Item.new('2010-01-01') }

  describe '#initialize' do
    it 'generates a random ID' do
      expect(item.id).to be_a(Integer)
    end

    it 'sets the publish date' do
      expect(item.publish_date).to eq('2010-01-01')
    end

    it 'sets archived to false by default' do
      expect(item.archived).to be(false)
    end

    it 'initializes the label as nil' do
      expect(item.label).to be_nil
    end

    it 'initializes the author as nil' do
      expect(item.author).to be_nil
    end
  end

  describe '#author=' do
    it 'sets the author attribute' do
      item.author = 'John Doe'
      expect(item.author).to eq('John Doe')
    end
  end

  describe '#label=' do
    it 'sets the label attribute' do
      label = double('label')
      item.label = label
      expect(item.label).to eq(label)
    end
  end

  describe '#add_to_label' do
    let(:label) { double('label') }

    it 'adds the item to the label' do
      expect(label).to receive(:add_item).with(item)
      item.label = label
      item.add_to_label(label)
    end
  end

  describe '#add_to_author' do
    it 'adds the item to the author' do
      author = double('author')
      expect(author).to receive(:add_item).with(item)
      item.author = author
      item.add_to_author(author)
    end
  end
end
