class CreatePropostes < ActiveRecord::Migration[5.0]
  def change
    create_table :propostes do |t|
      t.integer :edifici_id
      t.string :nom
      t.text :descripcio
      t.string :cost
      t.string :estalvi
      t.string :reduccio_emissions
      t.string :retorn_inversio

      t.timestamps
    end
  end
end
