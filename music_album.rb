require_relative 'genre'
require_relative 'item'
require 'securerandom'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date

  def initialize(on_spotify, publish_date, id = nil)
    super(publish_date)
    @on_spotify = on_spotify
    @id = id || SecureRandom.uuid
  end

  def can_be_archived?
    super && on_spotify == true
  end
end
