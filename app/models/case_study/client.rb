require 'stringex'

module CaseStudy
  class Client < ActiveRecord::Base
    attr_accessible :name, :logo, :description, :link, :order

    has_attached_file :logo, :styles => CaseStudy.config.logo_styles

    has_many :case_studies, :class_name => 'CaseStudy::Item'

    validates_uniqueness_of :name

    validates_presence_of :name

    default_scope :order => '`case_study_clients`.`order` ASC'

    acts_as_url :name

    def to_param
      url
    end

    def to_s
      name
    end
  end
end
