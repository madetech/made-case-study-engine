class CreateCaseStudyItem < ActiveRecord::Migration
  def up
    create_table :case_study_items do |t|
      t.text        :description
      t.string      :excerpt
      t.text        :external_url
      t.integer     :order, :default => 9999
      t.text        :outcomes
      t.string      :title
      t.string      :type
      t.string      :url

      t.timestamps
    end

    add_attachment :case_study_items, :feature_image

    add_index :case_study_items, :url, unique: true
    add_index :case_study_items, :type
  end

  def down
    remove_attachment :case_study_items, :feature_image
    drop_table :case_study_items
  end
end
