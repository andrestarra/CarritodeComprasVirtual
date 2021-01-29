class CarritosController < ApplicationController
  def show
    @articulos_pedidos = pedido_actual.articulos_pedidos
  end
end
