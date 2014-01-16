require 'stringex'

module CaseStudy
  class Media < ActiveRecord::Base
    belongs_to :case_study, :class_name => 'CaseStudy::Item'

    attr_accessible :image, :order, :video_embed

    has_attached_file :image, :styles => CaseStudy.config.image_styles

    validates_presence_of :image

    default_scope :order => '`case_study_media`.`order` ASC'

    def is_video?
      unless self.video_embed.blank?
        return true
      end

      false
    end
  end
end
