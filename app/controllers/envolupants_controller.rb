class EnvolupantsController < ApplicationController
  include CheckUser
  before_action :set_envolupant, only: [:edit, :update]
  before_action :set_edifici

  def edit
    @subnavigation = true
    @submenu_actiu = 'envolupant'
    check_user_edifici(@edifici.id)
  end

  def update
    respond_to do |format|
      if @envolupant.update(envolupant_params)
        format.html { redirect_to edit_envolupant_path, notice: t('.guardat_ok') }
        format.json { render :show, status: :ok, location: @envolupant }
      else
        format.html { render :edit }
        format.json { render json: @envolupant.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_envolupant
      @envolupant = Envolupant.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(@envolupant.edifici_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def envolupant_params
      params.require(:envolupant).permit(:edifici_id, :millores_facana, :millores_coberta, :tipus_finestres, :estanquitat_finestres, :descripcio_facanes, :descripcio_coberta, :descripcio_terra, :descripcio_finestres, :puntuacio_facanes, :puntuacio_coberta, :puntuacio_terra, :puntuacio_finestres)
    end
end
