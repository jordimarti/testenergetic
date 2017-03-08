class CreateConsums < ActiveRecord::Migration[5.0]
  def change
    create_table :consums do |t|
      t.integer :edifici_id
      t.decimal :energia_primaria
      t.decimal :emissions
      t.string :qualificacio_energia_primaria
      t.string :qualificacio_emissions
      t.integer :potencia_contractada
      t.integer :electricitat_consum_anual
      t.decimal :electricitat_emissions
      t.decimal :electricitat_preu
      t.integer :electricitat_estimacio_consum_millores
      t.integer :gas_consum_anual
      t.decimal :gas_emissions
      t.decimal :gas_preu
      t.integer :gas_estimacio_consum_millores
      t.integer :gasoil_consum_anual
      t.decimal :gasoil_emissions
      t.decimal :gasoil_preu
      t.integer :gasoil_estimacio_consum_millores
      t.string :calefaccio_font_energia
      t.integer :calefaccio_percentatge_consum
      t.string :calefaccio2_font_energia
      t.integer :calefaccio2_percentatge_consum
      t.string :acs_font_energia
      t.integer :acs_percentatge_consum
      t.integer :refrigeracio_percentatge_consum
      t.integer :iluminacio_percentatge_consum
      t.integer :electrodomestics_percentatge_consum

      t.timestamps
    end
  end
end
