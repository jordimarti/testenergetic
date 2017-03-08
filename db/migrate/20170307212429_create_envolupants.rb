class CreateEnvolupants < ActiveRecord::Migration[5.0]
  def change
    create_table :envolupants do |t|
      t.integer :edifici_id
      t.string :millores_facana
      t.string :millores_coberta
      t.string :tipus_finestres
      t.string :estanquitat_finestres
      t.text :descripcio_facanes
      t.text :descripcio_coberta
      t.text :descripcio_terra
      t.text :descripcio_finestres
      t.string :puntuacio_facanes
      t.string :puntuacio_coberta
      t.string :puntuacio_terra
      t.string :puntuacio_finestres

      t.timestamps
    end
  end
end
