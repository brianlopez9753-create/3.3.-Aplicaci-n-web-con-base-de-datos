class RegistrosController < ApplicationController
  before_action :set_registro, only: %i[show edit update destroy]

  def index
    @registros = Registro.order(created_at: :desc)
  end

  def show
  end

  def new
    @registro = Registro.new
  end

  def edit
  end

  def create
    @registro = Registro.new(registro_params)

    if @registro.save
      redirect_to @registro, notice: "El registro se agregó correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @registro.update(registro_params)
      redirect_to @registro, notice: "Los cambios se guardaron correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @registro.destroy!
    redirect_to registros_path, notice: "El registro se eliminó correctamente.", status: :see_other
  end

  private

  def set_registro
    @registro = Registro.find(params[:id])
  end

  def registro_params
    params.require(:registro).permit(:nombre, :correo, :telefono, :observaciones)
  end
end
