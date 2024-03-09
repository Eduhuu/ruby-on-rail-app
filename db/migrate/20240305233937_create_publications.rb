class CreatePublications < ActiveRecord::Migration[7.1]
  def change
    create_table :publications do |t|
      t.string :title, null:false
      t.string :content, null:false
      t.boolean :blocked, null:false
      t.timestamps
    end
  end
end
