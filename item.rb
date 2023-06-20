require 'date'

class Item

    def initalize (publish_date)
        @id = Random.rand(1...1000)
        @publish_date = publish_date
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