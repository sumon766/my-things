require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archived = archived
    @label = nil
    @genre = nil
    @author = nil
  end

  def can_be_archived?
    current_time = Time.now.year
    published_time = Date.parse(publish_date).year
    archive_cond = current_time - published_time
    archive_cond > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
