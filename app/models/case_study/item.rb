require 'stringex'

module CaseStudy
  class Item < ActiveRecord::Base
    attr_accessible :additional_media_attributes, :created_at, :description, :excerpt, :external_url, :feature_image,
      :order, :outcomes, :quotes_attributes, :taxonomies_attributes, :title, :updated_at, :url

    has_attached_file :feature_image, :styles => CaseStudy.config.image_styles

    has_many :additional_media, :class_name => 'CaseStudy::Media', :dependent => :destroy,
      :foreign_key => 'case_study_id'
    accepts_nested_attributes_for :additional_media, :allow_destroy => true

    has_many :categories, :through => :taxonomies, :class_name => 'CaseStudy::Category',
      :source => 'taxonomable', :source_type => 'CaseStudy::Category'

    has_many :quotes, :class_name => 'CaseStudy::Quote', :dependent => :destroy,
      :foreign_key => 'case_study_id'
    accepts_nested_attributes_for :quotes, :allow_destroy => true

    has_many :tags, :through => :taxonomies, :class_name => 'CaseStudy::Tag',
      :source => 'taxonomable', :source_type => 'CaseStudy::Tag'

    has_many :taxonomies, :class_name => 'CaseStudy::Taxonomy', :dependent => :destroy,
      :foreign_key => 'case_study_id'
    accepts_nested_attributes_for :taxonomies, :allow_destroy => true

    validates :excerpt, length: { maximum: 90 }

    validates_presence_of :description, :excerpt, :feature_image, :title

    validates_uniqueness_of :title

    default_scope :order => '`order` ASC'

    acts_as_url :title

    def to_param
      url
    end

    def to_s
      title
    end

    def is_in_category?(category_slug)
      begin
        category = Category.find_by_url!(category_slug)
      rescue => error
        return false
      end

      self.categories.include?(category)
    end
  end
end
