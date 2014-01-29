class AddClientIdToCaseStudies < ActiveRecord::Migration
  def change
    add_column :case_study_items, :client_id, :integer
    add_index :case_study_items, :client_id
  end
end
