class CreateCaseStudyCategory < ActiveRecord::Migration
  def up
    create_table :case_study_categories do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end

  def down
    drop_table :case_study_categories
  end
end
