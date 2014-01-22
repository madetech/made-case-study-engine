class AddOrderToCategories < ActiveRecord::Migration
  def change
    add_column :case_study_categories, :order, :integer, default: 9999
    add_index :case_study_categories, :order
  end
end
