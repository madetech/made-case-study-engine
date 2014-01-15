class CreateCaseStudyMedia < ActiveRecord::Migration
  def up
    create_table :case_study_media do |t|
      t.belongs_to  :case_study
      t.integer     :order, :default => 9999
      t.text        :video_embed
    end

    add_attachment :case_study_media, :image

    add_index :case_study_media, :case_study_id
  end

  def down
    remove_attachment :case_study_media, :image
    drop_table :case_study_media
  end
end

