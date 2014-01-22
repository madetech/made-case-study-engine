class AddOrderToTags < ActiveRecord::Migration
  def change
    add_column :case_study_tags, :order, :integer, default: 9999
    add_index :case_study_tags, :order
  end
end
