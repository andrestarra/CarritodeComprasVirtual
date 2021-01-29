class ArticulosController < ApplicationController
  def index
    @articulos = Articulo.all
  end

  def show
    @articulo = find_articulo
  end

  def new
    @articulo = Articulo.new
  end

  def create
    @articulo = Articulo.new(articulo_params)

    if @articulo.save
      redirect_to @articulo
    else
      render :new
    end
  end

  def edit
    @articulo = find_articulo
  end

  def update
    @articulo = find_articulo

    if @articulo.update(articulo_params)
      redirect_to @articulo
    else
      render :edit
    end
  end

  def destroy
    @articulo = find_articulo
    @articulo.destroy

    redirect_to root_path
  end

  private
    def find_articulo
      Articulo.find(params[:id])
    end

    def articulo_params
      params.require(:articulo).permit(:nombre, :precio, :cantidad)
    end
end
