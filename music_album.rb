require_relative 'genre'
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date

  def initializeid(on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived
    super && on_spotify == true
  end
end
