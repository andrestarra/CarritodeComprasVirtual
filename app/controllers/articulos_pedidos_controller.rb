class ArticulosPedidosController < ApplicationController
  def create
    @pedido = pedido_actual
    @articulos_pedido = @pedido.articulos_pedidos.new(articulos_pedido_params)
    @pedido.save
    session[:pedido_id] = @pedido.id
  end

  def update
    @pedido = pedido_actual
    @articulos_pedido = @pedido.articulos_pedidos.find(params[:id])
    @articulos_pedido.update_attributes(articulos_pedido_params)
    @articulos_pedidos = pedido_actual.articulos_pedidos
  end

  def destroy
    @pedido = pedido_actual
    @articulos_pedido = @pedido.articulos_pedidos.find(params[:id])
    @articulos_pedido.destroy
    @articulos_pedidos = pedido_actual.articulos_pedidos
  end

  private

  def articulos_pedido_params
    params.require(:articulos_pedido).permit(:articulo_id, :cantidad)
  end
end
