class AddTypeToCaseStudyModels < ActiveRecord::Migration
  def change
    add_column :case_study_categories, :type, :string
    add_index :case_study_categories, :type

    add_column :case_study_media, :type, :string
    add_index :case_study_media, :type

    add_column :case_study_quotes, :type, :string
    add_index :case_study_quotes, :type

    add_column :case_study_tags, :type, :string
    add_index :case_study_tags, :type

    add_column :case_study_taxonomies, :type, :string
    add_index :case_study_taxonomies, :type
  end
end
