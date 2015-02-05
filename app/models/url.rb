class Url < ActiveRecord::Base
  after_create :generate_slug

  def generate_slug
    self.slug = id.to_s(36)
    save!
  end

  def increment_hits
    self.hits += 1
    save!
  end

  def self.sorted_by_popularity
    all.sort_by { |url| -url.hits }
  end
end
