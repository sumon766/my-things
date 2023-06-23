require_relative '../item'

RSpec.describe Item do
  let(:item) { Item.new('2020-01-01') }

  describe '#initialize' do
    it 'generates a random ID' do
      expect(item.id).to be_a(Integer)
    end

    it 'sets the publish date' do
      expect(item.publish_date).to eq('2020-01-01')
    end

    it 'sets archived to false by default' do
      expect(item.archived).to be(false)
    end

    it 'initializes the label as nil' do
      expect(item.label).to be_nil
    end

    it 'initializes the genre as nil' do
      expect(item.genre).to be_nil
    end

    it 'initializes the author as nil' do
      expect(item.author).to be_nil
    end
  end

  describe '#can_be_archived?' do
    it 'returns true when the item can be archived' do
      item = Item.new("#{Time.now.year - 11}-01-01")
      expect(item.can_be_archived?).to be(true)
    end

    it 'returns false when the item cannot be archived' do
      item = Item.new("#{Time.now.year}-01-01")
      expect(item.can_be_archived?).to be(false)
    end
  end

  describe '#move_to_archive' do
    it 'sets archived to true when the item can be archived' do
      item = Item.new("#{Time.now.year - 11}-01-01")
      item.move_to_archive
      expect(item.archived).to be(true)
    end

    it 'sets archived to false when the item cannot be archived' do
      item = Item.new("#{Time.now.year}-01-01")
      item.move_to_archive
      expect(item.archived).to be(false)
    end
  end
end
