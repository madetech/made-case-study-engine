class CreateCaseStudyClients < ActiveRecord::Migration
  def change
    create_table :case_study_clients do |t|
      t.string      :name
      t.string      :url
      t.text        :description
      t.string      :link
      t.integer     :order, :default => 9999

      t.timestamps
    end

    add_attachment :case_study_clients, :logo

    add_index :case_study_clients, :url, unique: true
  end
end
