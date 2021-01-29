class ArticulosPedido < ApplicationRecord
  belongs_to :pedido
  belongs_to :articulo

  before_save :set_precio_unidad
  before_save :total

  def precio_unidad
    if persisted?
      self[:precio_unidad]
    else
      articulo.precio
    end
  end

  def total
    precio_unidad * cantidad
  end

  private

  def set_precio_unidad
    self[:precio_unidad] = precio_unidad
  end

  def set_total
    self[:total] = total
  end
end
