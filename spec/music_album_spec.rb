require_relative '../music_album'
require_relative '../item'

RSpec.describe MusicAlbum do
  describe '#initialize' do
    it 'creates a new music album instance with the provided attributes' do
      album = MusicAlbum.new(true, '2023-06-21')

      expect(album.on_spotify).to be true
      expect(album.publish_date).to eq('2023-06-21')
      expect(album.id).not_to be_nil
    end

    it 'assigns a custom ID if provided' do
      custom_id = 'custom-id'
      album = MusicAlbum.new(true, '2023-06-21', custom_id)

      expect(album.id).to eq(custom_id)
    end
  end
end
