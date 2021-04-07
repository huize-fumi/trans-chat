class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content,   null:false, default:""
      t.string :title,     null:false, default:""

      t.references :user
      t.references :room

      t.timestamps
    end
  end
end
