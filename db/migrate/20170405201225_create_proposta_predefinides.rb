class CreatePropostaPredefinides < ActiveRecord::Migration[5.0]
  def change
    create_table :proposta_predefinides do |t|
      t.integer :edifici_id
      t.string :nom_ca
      t.string :nom_es
      t.text :descripcio_ca
      t.text :descripcio_es
      t.string :cost
      t.string :estalvi
      t.string :reduccio_emissions
      t.string :retorn_inversio
      t.string :categoria

      t.timestamps
    end
  end
end
