class CreateCaseStudyQuote < ActiveRecord::Migration
  def up
    create_table :case_study_quotes do |t|
      t.string      :author
      t.string      :author_role
      t.string      :company
      t.belongs_to  :case_study
      t.integer     :order, :default => 9999
      t.text        :text
    end

    add_attachment :case_study_quotes, :author_image

    add_index :case_study_quotes, :case_study_id
  end

  def down
    drop_table :case_study_quotes
  end
end
