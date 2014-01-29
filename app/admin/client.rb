if defined?(ActiveAdmin) and CaseStudy.config.engine_active_admin
  ActiveAdmin.register CaseStudy::Client do
    menu :parent => "Case Studies", :label => "Clients", :priority => 4

    filter          :name
    filter          :created_at

    controller do
      cache_sweeper CaseStudy.config.client_cache_sweeper if CaseStudy.config.client_cache_sweeper
      defaults      :finder => :find_by_url
    end

    form do |f|
      f.inputs "Client" do
        f.input :name

        f.input :logo,
          :hint => f.template.image_tag(f.object.logo.url(:thumb))

        f.input :description,
          :as => :rich,
          :config => { :width => '76%', :height => '400px' }

        f.input :link

        f.input :order
      end

      f.actions
    end

    index :title => 'Client' do
      column :name
      column :created_at
      column :updated_at

      default_actions
    end
  end
end
