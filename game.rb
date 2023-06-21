require_relative 'item'

class Game < item
  attr_reader :id
  attr_accessor :title, :publish_date, :multiplayer, :last_played_at

  def initialize(title, publish_date, multiplayer: nil, last_played_at, author_id)
    @id = Random.rand(1..1000)
    super(publish_date)
    @title = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @author_id = author_id
  end

  def can_be_archived?
    super && last_played_at < (Time.now - 2.years)
  end
end
