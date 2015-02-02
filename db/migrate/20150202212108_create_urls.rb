class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :given_url
      t.string :slug
      t.integer :hits, default: 0
      t.string :title

      t.timestamps null: false
    end
  end
end
