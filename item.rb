require 'date'

class Item
  attr_reader :id, :archived, :publish_date, :author, :label

  def initialize(publish_date, archived: false)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archived = archived
    @label = nil
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

  # rubocop:disable Style/TrivialAccessors
  def author=(value)
    @author = value
  end

  def label=(value)
    @label = value
  end
  # rubocop:enable Style/TrivialAccessors

  def add_to_label(*)
    @label.add_item(self)
  end

  def add_to_author(*)
    @author.add_item(self)
  end
end
