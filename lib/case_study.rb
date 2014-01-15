require "case_study/engine"

module CaseStudy
  mattr_accessor :item_cache_sweeper
  @@item_cache_sweeper = false

  mattr_accessor :category_cache_sweeper
  @@category_cache_sweeper = false

  mattr_accessor :tag_cache_sweeper
  @@tag_cache_sweeper = false

  mattr_accessor :engine_active_admin
  @@engine_active_admin = true

  mattr_accessor :engine_routing
  @@engine_routing = true

  mattr_accessor :image_styles
  @@image_styles = {}

  class Engine < Rails::Engine
    isolate_namespace CaseStudy
  end

  def self.config(&block)
    yield self if block
    return self
  end
end
