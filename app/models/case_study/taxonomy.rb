module CaseStudy
  class Taxonomy < ActiveRecord::Base
    belongs_to :case_study, :class_name => 'CaseStudy::Item'
    belongs_to :taxonomable, polymorphic: true

    attr_accessible :order, :case_study_id

    validates :case_study_id, :presence => true, :uniqueness => { :scope => :taxonomable_id }

    default_scope :order => '`case_study_taxonomies`.`order` ASC'

    scope :to_categories, -> { where arel_table[:taxonomable_type].eq('CaseStudy::Category') }
    scope :to_case_studies, -> { where arel_table[:case_study_id].not_eq(nil) }
    scope :to_tags, -> { where arel_table[:taxonomable_type].eq('CaseStudy::Tag') }
  end
end
