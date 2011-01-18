module RandomSlug
  def self.slug
    rand(36**10).to_s(36)
  end

  def random_slug
    @random_slug ||= persisted? ? friendly_id : RandomSlug::slug
  end
end

ActiveRecord::Base.send :include, RandomSlug