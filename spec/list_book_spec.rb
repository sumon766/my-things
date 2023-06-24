require_relative '../list_book'

describe ListBook do
  let(:list_book) { ListBook.new }

  describe '#list_labels' do
    context 'when there are labels' do
      before do
        list_book.instance_variable_set(:@labels, [
                                          Label.new('Fiction', 'Red'),
                                          Label.new('Fantasy', 'Blue')
                                        ])
      end

      it 'prints the details of each label' do
        expected_output = <<~OUTPUT
          Title: Fiction, Color: Red
          Title: Fantasy, Color: Blue

        OUTPUT
        expect { list_book.list_labels }.to output(expected_output).to_stdout
      end
    end
  end

  describe '#list_all_book' do
    context 'when there are books' do
      before do
        list_book.instance_variable_set(:@books, [
                                          Book.new('2022-01-01', 'Publisher A', 'GOOD'),
                                          Book.new('2022-02-01', 'Publisher B', 'BAD')
                                        ])
      end

      it 'prints the details of each book' do
        expected_output = <<~OUTPUT
          Publish date: 2022-01-01, Publisher: Publisher A, Cover state: GOOD
          Publish date: 2022-02-01, Publisher: Publisher B, Cover state: BAD

        OUTPUT
        expect { list_book.list_all_book }.to output(expected_output).to_stdout
      end
    end
  end
end
