# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_29_123736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articulos", force: :cascade do |t|
    t.string "nombre"
    t.integer "precio"
    t.integer "cantidad"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "articulos_pedidos", force: :cascade do |t|
    t.integer "precio_unidad"
    t.integer "cantidad"
    t.integer "total"
    t.bigint "pedido_id", null: false
    t.bigint "articulo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["articulo_id"], name: "index_articulos_pedidos_on_articulo_id"
    t.index ["pedido_id"], name: "index_articulos_pedidos_on_pedido_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer "subtotal"
    t.integer "impuesto"
    t.integer "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "usuario_id", null: false
    t.index ["usuario_id"], name: "index_pedidos_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.string "nombre"
    t.string "apellido"
    t.string "identificacion", default: "", null: false
    t.string "celular"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["identificacion"], name: "index_usuarios_on_identificacion", unique: true
  end

  add_foreign_key "articulos_pedidos", "articulos"
  add_foreign_key "articulos_pedidos", "pedidos"
  add_foreign_key "pedidos", "usuarios"
end
