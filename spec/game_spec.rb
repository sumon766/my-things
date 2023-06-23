require_relative '../game'

describe Game do
  let(:title) { 'Example Game' }
  let(:publish_date) { Time.now }
  let(:last_played_at) { Time.now - (3 * 365 * 24 * 60 * 60) }
  let(:multiplayer) { true }

  describe '#initialize' do
    it 'creates a new game instance with the provided attributes' do
      game = Game.new(title, publish_date, last_played_at, multiplayer)
      expect(game.title).to eq(title)
      expect(game.publish_date).to eq(publish_date)
      expect(game.last_played_at).to eq(last_played_at)
      expect(game.multiplayer).to eq(multiplayer)
    end

    it 'assigns a unique ID to each game instance' do
      game1 = Game.new(title, publish_date, last_played_at, multiplayer)
      game2 = Game.new(title, publish_date, last_played_at, multiplayer)
      expect(game1.id).not_to eq(game2.id)
    end
  end
end
