class CreateArticulosPedidos < ActiveRecord::Migration[6.0]
  def change
    create_table :articulos_pedidos do |t|
      t.integer :precio_unidad
      t.integer :cantidad
      t.integer :total
      t.references :pedido, null: false, foreign_key: true
      t.references :articulo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
