class AddUsuarioRefToPedidos < ActiveRecord::Migration[6.0]
  def change
    add_reference :pedidos, :usuario, null: false, foreign_key: true
  end
end
