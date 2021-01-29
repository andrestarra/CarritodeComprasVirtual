module ApplicationHelper
  def pedido_actual
    if session[:pedido_id].nil?
      Pedido.find(session[:pedido_id])
    else
      Pedido.new
    end
  end
end
