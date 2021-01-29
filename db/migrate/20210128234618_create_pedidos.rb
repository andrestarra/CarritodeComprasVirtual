class CreatePedidos < ActiveRecord::Migration[6.0]
  def change
    create_table :pedidos do |t|
      t.integer :subtotal
      t.integer :impuesto
      t.integer :total

      t.timestamps
    end
  end
end
