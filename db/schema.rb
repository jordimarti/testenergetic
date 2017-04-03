# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170403143103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consums", force: :cascade do |t|
    t.integer  "edifici_id"
    t.decimal  "energia_primaria"
    t.decimal  "emissions"
    t.string   "qualificacio_energia_primaria"
    t.string   "qualificacio_emissions"
    t.integer  "potencia_contractada"
    t.integer  "electricitat_consum_anual"
    t.decimal  "electricitat_emissions"
    t.decimal  "electricitat_preu"
    t.integer  "electricitat_estimacio_consum_millores"
    t.integer  "gas_consum_anual"
    t.decimal  "gas_emissions"
    t.decimal  "gas_preu"
    t.integer  "gas_estimacio_consum_millores"
    t.integer  "gasoil_consum_anual"
    t.decimal  "gasoil_emissions"
    t.decimal  "gasoil_preu"
    t.integer  "gasoil_estimacio_consum_millores"
    t.string   "calefaccio_font_energia"
    t.integer  "calefaccio_percentatge_consum"
    t.string   "calefaccio2_font_energia"
    t.integer  "calefaccio2_percentatge_consum"
    t.string   "acs_font_energia"
    t.integer  "acs_percentatge_consum"
    t.integer  "refrigeracio_percentatge_consum"
    t.integer  "iluminacio_percentatge_consum"
    t.integer  "electrodomestics_percentatge_consum"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "edificis", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nom_edifici"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "envolupants", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "millores_facana"
    t.string   "millores_coberta"
    t.string   "tipus_finestres"
    t.string   "estanquitat_finestres"
    t.text     "descripcio_facanes"
    t.text     "descripcio_coberta"
    t.text     "descripcio_terra"
    t.text     "descripcio_finestres"
    t.string   "puntuacio_facanes"
    t.string   "puntuacio_coberta"
    t.string   "puntuacio_terra"
    t.string   "puntuacio_finestres"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "identificacions", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "tipus_via"
    t.string   "nom_via"
    t.string   "numero_via"
    t.string   "bloc"
    t.integer  "codi_postal"
    t.string   "poblacio"
    t.string   "provincia"
    t.string   "periode_construccio"
    t.integer  "any_construccio"
    t.decimal  "superficie_util"
    t.string   "nom_propietari"
    t.string   "cognoms_propietari"
    t.string   "tipus_document_identitat_propietari"
    t.string   "numero_document_identitat_propietari"
    t.string   "email_propietari"
    t.string   "tel_fix_propietari"
    t.string   "tel_mobil_propietari"
    t.string   "adreca_propietari"
    t.string   "codi_postal_propietari"
    t.string   "municipi_propietari"
    t.string   "tipus_projecte"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "foto_facana_file_name"
    t.string   "foto_facana_content_type"
    t.integer  "foto_facana_file_size"
    t.datetime "foto_facana_updated_at"
  end

  create_table "instalacions", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "sistema_acs_calefaccio"
    t.string   "antiguitat_acs"
    t.string   "antiguitat_calefaccio"
    t.string   "sistema_refrigeracio"
    t.string   "antiguitat_refrigeracio"
    t.string   "sistema_iluminacio"
    t.integer  "potencia_iluminacio"
    t.text     "descripcio_acs"
    t.text     "descripcio_calefaccio"
    t.text     "descripcio_refrigeracio"
    t.text     "descripcio_iluminacio"
    t.text     "descripcio_electrodomestics"
    t.string   "puntuacio_acs"
    t.string   "puntuacio_calefaccio"
    t.string   "puntuacio_refrigeracio"
    t.string   "puntuacio_iluminacio"
    t.string   "puntuacio_electrodomestics"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "propostes", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom"
    t.text     "descripcio"
    t.string   "cost"
    t.string   "estalvi"
    t.string   "reduccio_emissions"
    t.string   "retorn_inversio"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role",                   default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
