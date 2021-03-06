class CreateIdentificacions < ActiveRecord::Migration[5.0]
  def change
    create_table :identificacions do |t|
      t.integer :edifici_id
      t.string :tipus_via
      t.string :nom_via
      t.string :numero_via
      t.string :bloc
      t.integer :codi_postal
      t.string :poblacio
      t.string :provincia
      t.string :periode_construccio
      t.integer :any_construccio
      t.decimal :superficie_util
      t.string :nom_propietari
      t.string :cognoms_propietari
      t.string :tipus_document_identitat_propietari
      t.string :numero_document_identitat_propietari
      t.string :email_propietari
      t.string :tel_fix_propietari
      t.string :tel_mobil_propietari
      t.string :adreca_propietari
      t.string :codi_postal_propietari
      t.string :municipi_propietari
      t.string :tipus_projecte

      t.timestamps
    end
  end
end
