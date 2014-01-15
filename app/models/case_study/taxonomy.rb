module CaseStudy
  class Taxonomy < ActiveRecord::Base
    belongs_to :case_study, :class_name => 'CaseStudy::Item'
    belongs_to :taxonomable, polymorphic: true

    attr_accessible :order, :case_study_id

    validates :case_study_id, :presence => true, :uniqueness => { :scope => :taxonomable_id }

    default_scope :order => '`order` ASC'
  end
end
