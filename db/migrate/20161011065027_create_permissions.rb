class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.belongs_to :user, index:true
      t.string :entity, default: false
      t.boolean :read_perm, default: false
      t.boolean :create_perm, default: false
      t.boolean :update_perm, default: false
      t.boolean :destroy_perm, default: false
      t.timestamps null: false
    end
  end
end
