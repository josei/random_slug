module RandomSlug
  def self.slug
    rand(36**10).to_s(36)
  end

  def random_slug
    if read_attribute(friendly_id_config.cache_column).nil?
      self.send :"#{friendly_id_config.cache_column}=", RandomSlug::slug
    else
      read_attribute(friendly_id_config.cache_column)
    end
  end
end

ActiveRecord::Base.send :include, RandomSlug