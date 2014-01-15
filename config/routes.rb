if CaseStudy.config.engine_routing
  CaseStudy::Engine.routes.draw do
    root                             :to => 'case_study#index',        :as => 'case_studies',        :via => [:get]

    match '/:category',              :to => 'case_stud#category',      :as => 'case_study_category', :via => [:get]
    match '/:category/:case_study',  :to => 'case_study#show',         :as => 'case_study',          :via => [:get]
  end
end
