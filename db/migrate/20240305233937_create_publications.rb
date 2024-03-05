class CreatePublications < ActiveRecord::Migration[7.1]
  def change
    create_table :publications do |t|
      t.string :title
      t.string :image
      t.string :content
      t.boolean :blocked

      t.timestamps
    end
  end
end
