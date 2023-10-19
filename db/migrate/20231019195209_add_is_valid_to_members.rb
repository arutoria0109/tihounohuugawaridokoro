class AddIsValidToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :is_valid, :boolean, default: true, null: false
  end
end
