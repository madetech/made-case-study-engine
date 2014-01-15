if defined?(ActiveAdmin) and CaseStudy.config.engine_active_admin
  ActiveAdmin.register CaseStudy::Item do
    menu :parent => "Case Studies", :label => "Case Study", :priority => 1

    filter          :title
    filter          :created_at

    controller do
      cache_sweeper CaseStudy.config.item_cache_sweeper if CaseStudy.config.item_cache_sweeper
      defaults      :finder => :find_by_url
    end

    form do |f|
      f.inputs "Case Study" do
        f.input :title

        f.input :external_url,
                :as => :string

        f.input :excerpt

        f.input :description,
                :as => :rich,
                :config => { :width => '76%', :height => '400px' }

        f.input :outcomes,
                :as => :rich,
                :config => { :width => '76%', :height => '300px' }

        f.input :order
      end

      f.inputs "Media" do
        f.input :feature_image,
                :hint => f.template.image_tag(f.object.feature_image.url(:thumb))

        f.has_many :additional_media do |fm|
          fm.input :image

          fm.input :video_embed

          fm.input :order

          fm.input :_destroy, :as => :boolean
        end
      end

      f.inputs "Quotes" do
        f.has_many :quotes do |fq|
          fq.input :author

          fq.input :author_role

          fq.input :author_image

          fq.input :text,
            :as => :rich,
            :config => { :width => '76%', :height => '300px' },
            :label => "Quote"

          fq.input :order

          fq.input :_destroy, :as => :boolean
        end
      end

      f.actions
    end

    index :title => 'Case Study' do
      column :title
      column :created_at
      column :updated_at

      default_actions
    end
  end
end
