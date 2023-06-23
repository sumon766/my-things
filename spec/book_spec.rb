require_relative '../book'

RSpec.describe Book do
  describe '#initialize' do
    it 'creates a new book instance with the provided publisher and cover state' do
      publish_date = '2022-01-01'
      publisher = 'Little, Brown and Company'
      cover_state = 'bad'

      book = Book.new(publish_date, publisher, cover_state)

      expect(book.publisher).to eq(publisher)
      expect(book.cover_state).to eq(cover_state)
    end
  end

  # describe '#can_be_archived?' do
  #   it 'returns true when the cover state is bad' do
  #     publish_date = '2022-01-01'
  #     publisher = 'Little, Brown and Company'
  #     cover_state = 'bad'

  #     book = Book.new(publish_date, publisher, cover_state)

  #     expect(book.send(:can_be_archived?)).to eq(true)
  #   end

  #   it 'returns false when the cover state is not bad' do
  #     publish_date = '2022-01-01'
  #     publisher = 'Little, Brown and Company'
  #     cover_state = 'good'

  #     book = Book.new(publish_date, publisher, cover_state)

  #     expect(book.send(:can_be_archived?)).to eq(false)
  #   end

  #   it 'returns false when the publish date is less than 5 years ago' do
  #     publish_date = '2020-01-01'
  #     publisher = 'Little, Brown and Company'
  #     cover_state = 'good'

  #     book = Book.new(publish_date, publisher, cover_state)

  #     expect(book.send(:can_be_archived?)).to eq(false)
  #   end
  # end
end
