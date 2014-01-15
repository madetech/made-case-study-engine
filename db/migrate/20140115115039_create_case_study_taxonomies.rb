class CreateCaseStudyTaxonomies < ActiveRecord::Migration
  def up
    create_table :case_study_taxonomies do |t|
      t.belongs_to  :case_study
      t.references :taxonomable, polymorphic: true
      t.integer :order, :default => 9999
    end

    add_index :case_study_taxonomies, :taxonomable_id
    add_index :case_study_taxonomies, :case_study_id
  end

  def down
    drop_table :case_study_taxonomies
  end
end
