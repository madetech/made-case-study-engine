class CreateCaseStudyTag < ActiveRecord::Migration
  def up
    create_table :case_study_tags do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end

  def down
    drop_table :case_study_tags
  end
end
