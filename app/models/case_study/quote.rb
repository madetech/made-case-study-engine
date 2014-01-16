module CaseStudy
  class Quote < ActiveRecord::Base
    belongs_to :case_study, :class_name => 'CaseStudy::Item'

    attr_accessible :company, :author, :author_role, :order, :text

    has_attached_file :author_image, :styles => CaseStudy.config.image_styles

    default_scope :order => '`case_study_quotes`.`order` ASC'

    validates_presence_of :author, :text
  end
end
