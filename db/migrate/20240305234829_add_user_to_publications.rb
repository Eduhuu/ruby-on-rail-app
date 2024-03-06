class AddUserToPublications < ActiveRecord::Migration[7.1]
  def change
    add_reference :publications, :user, null: false, foreign_key: true
  end
end
