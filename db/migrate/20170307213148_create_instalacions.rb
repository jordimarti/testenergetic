class CreateInstalacions < ActiveRecord::Migration[5.0]
  def change
    create_table :instalacions do |t|
      t.integer :edifici_id
      t.string :sistema_acs_calefaccio
      t.string :antiguitat_acs
      t.string :antiguitat_calefaccio
      t.string :sistema_refrigeracio
      t.string :antiguitat_refrigeracio
      t.string :sistema_iluminacio
      t.integer :potencia_iluminacio
      t.text :descripcio_acs
      t.text :descripcio_calefaccio
      t.text :descripcio_refrigeracio
      t.text :descripcio_iluminacio
      t.text :descripcio_electrodomestics
      t.string :puntuacio_acs
      t.string :puntuacio_calefaccio
      t.string :puntuacio_refrigeracio
      t.string :puntuacio_iluminacio
      t.string :puntuacio_electrodomestics

      t.timestamps
    end
  end
end
