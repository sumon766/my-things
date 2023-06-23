require_relative '../list_music'

describe ListMusic do
  let(:list_music) { ListMusic.new }

  describe '#list_genres' do
    context 'when there are genres' do
      before do
        list_music.instance_variable_set(:@genres, [
          Genre.new('Rock'),
          Genre.new('Pop')
        ])
      end

      it 'prints the details of each genre' do
        expected_output = <<~OUTPUT
          Genre: Rock
          Genre: Pop

        OUTPUT
        expect { list_music.list_genres }.to output(expected_output).to_stdout
      end
    end
  end

  describe '#list_music_albums' do
    context 'when there are music albums' do
      before do
        list_music.instance_variable_set(:@albums, [
          MusicAlbum.new(true, '2022-01-01'),
          MusicAlbum.new(false, '2022-02-01')
        ])
      end

      it 'prints the details of each music album' do
        expected_output = <<~OUTPUT
          Publish date: 2022-01-01, On spotify: true
          Publish date: 2022-02-01, On spotify: false

        OUTPUT
        expect { list_music.list_music_albums }.to output(expected_output).to_stdout
      end
    end
  end

  # Add more test cases for the remaining methods if needed
end
