class Pedido < ApplicationRecord
  has_many :articulos_pedidos

  before_save :set_subtotal
  before_save :set_impuesto
  before_save :set_total

  def subtotal
    st = articulos_pedidos.collect do |articulos_pedido|
      if articulos_pedido.valid?
        articulos_pedido.precio_unidad*articulos_pedido.cantidad
      else
        0
      end
    end
    st.sum
  end

  def impuesto
    subtotal * 0.16
  end
  
  def total
    subtotal + impuesto
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end

  def set_impuesto
    self[:impuesto] = impuesto
  end

  def set_total
    self[:total] = total
  end
end
