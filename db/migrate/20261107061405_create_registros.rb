class CreateRegistros < ActiveRecord::Migration[8.1]
  def change
    create_table :registros do |t|
      t.string :nombre, null: false
      t.string :correo, null: false
      t.string :telefono
      t.text :observaciones

      t.timestamps
    end
  end
end
