module CaseStudy
  class CaseStudyController < CaseStudy::ApplicationController
    layout 'application'

    def index
      @case_studies = CaseStudy::Item.all
    end

    def category
      # something
    end

    def show
      @case_study = CaseStudy::Item.find_by_url!(params[:case_study])

      raise ActiveRecord::RecordNotFound.new('Page not found') if @case_study.nil?
    end
  end
end
