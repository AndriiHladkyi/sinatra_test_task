class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text    :title
      t.string  :identificator
      t.float   :hours
      t.integer :visits
      t.boolean :visited, default: false
      t.boolean :destroyable, default: false

      t.timestamps
    end
  end
end
