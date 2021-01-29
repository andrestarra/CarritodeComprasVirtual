class InicioController < ApplicationController
  def index
    @articulos = Articulo.all
    @pedido = pedido_actual
    @articulos_pedidos = @pedido.articulos_pedidos.new
  end

  def show
    @articulo = Articulo.find(params[:id])
  end
end
