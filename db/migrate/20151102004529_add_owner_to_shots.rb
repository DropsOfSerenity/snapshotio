class AddOwnerToShots < ActiveRecord::Migration
  def change
    add_reference :shots, :owner, index: true
    add_foreign_key :shots, :users, column: :owner_id
  end
end
