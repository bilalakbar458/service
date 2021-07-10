class CreateConnectors < ActiveRecord::Migration[6.1]
  def change
    create_table :connectors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
