class InstalacionsController < ApplicationController
  include CheckUser
  before_action :set_instalacio, only: [:edit, :update]
  before_action :set_edifici

  def edit
    @subnavigation = true
    @submenu_actiu = 'instalacions'
    check_user_edifici(@edifici.id)
  end

  def update
    respond_to do |format|
      if @instalacio.update(instalacio_params)
        format.html { redirect_to edit_instalacio_path, notice: t('.guardat_ok') }
        format.json { render :show, status: :ok, location: @instalacio }
      else
        format.html { render :edit }
        format.json { render json: @instalacio.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instalacio
      @instalacio = Instalacio.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(@instalacio.edifici_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instalacio_params
      params.require(:instalacio).permit(:edifici_id, :sistema_acs_calefaccio, :antiguitat_acs, :antiguitat_calefaccio, :sistema_refrigeracio, :antiguitat_refrigeracio, :sistema_iluminacio, :potencia_iluminacio, :descripcio_acs, :descripcio_calefaccio, :descripcio_refrigeracio, :descripcio_iluminacio, :descripcio_electrodomestics, :puntuacio_acs, :puntuacio_calefaccio, :puntuacio_refrigeracio, :puntuacio_iluminacio, :puntuacio_electrodomestics)
    end
end
