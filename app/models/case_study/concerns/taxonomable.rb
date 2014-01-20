module CaseStudy
  module Concerns
    module Taxonomable
      extend ActiveSupport::Concern

      included do
        attr_accessible :case_studies, :taxonomies, :taxonomies_attributes

        has_many :taxonomies, :class_name => 'CaseStudy::Taxonomy', :as => :taxonomable, :dependent => :destroy
        accepts_nested_attributes_for :taxonomies, :allow_destroy => true

        has_many :case_studies, :class_name => 'CaseStudy::Item', :through => :taxonomies

        scope :with_case_studies, -> { includes(:taxonomies).merge(CaseStudy::Taxonomy.to_case_studies) }
      end
    end
  end
end
