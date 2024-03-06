class AddPublicationToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :publication, null: false, foreign_key: true
  end
end
