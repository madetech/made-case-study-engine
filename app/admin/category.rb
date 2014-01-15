if defined?(ActiveAdmin) and CaseStudy.config.engine_active_admin
  ActiveAdmin.register CaseStudy::Category do
    menu :parent => "Case Studies", :label => "Categories", :priority => 3

    filter          :name
    filter          :created_at

    controller do
      cache_sweeper CaseStudy.config.category_cache_sweeper if CaseStudy.config.category_cache_sweeper
      defaults      :finder => :find_by_url
    end

    form do |f|
      f.inputs "Category" do
        f.input :name

        f.has_many :taxonomies, heading: 'Order' do |ft|
          ft.input :case_study
          ft.input :order
          ft.input :_destroy, :as => :boolean
        end
      end

      f.actions
    end

    index :title => 'Case Study' do
      column :name
      column :created_at
      column :updated_at

      default_actions
    end
  end
end