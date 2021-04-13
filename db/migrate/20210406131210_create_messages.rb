class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content,   null:false, default:""

      t.references :user, foreigns_keys: true
      t.references :room, foreigns_keys: true

      t.timestamps
    end
  end
end
