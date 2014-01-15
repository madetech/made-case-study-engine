require CaseStudy::Engine.root.join('app', 'models', 'case_study', 'concerns', 'taxonomable')
require 'stringex'

module CaseStudy
  class Tag < ActiveRecord::Base
    include CaseStudy::Concerns::Taxonomable

    attr_accessible :name

    default_scope :order => '`name` ASC'

    acts_as_url :name

    def to_param
      url
    end

    def to_s
      name
    end
  end
end
