class ConsumsController < ApplicationController
  include CheckUser
  before_action :set_consum, only: [:edit, :update]
  before_action :set_edifici

  def edit
    @subnavigation = true
    @submenu_actiu = 'consums'
    check_user_edifici(@edifici.id)
  end

  def update
    respond_to do |format|
      if @consum.update(consum_params)
        format.html { redirect_to edit_consum_path, notice: "Les dades s'han guardat correctament." }
        format.json { render :show, status: :ok, location: @consum }
      else
        format.html { render :edit }
        format.json { render json: @consum.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_consum
      @consum = Consum.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(@consum.edifici_id)
    end

    def consum_params
      params.require(:consum).permit(:edifici_id, :energia_primaria, :emissions, :qualificacio_energia_primaria, :qualificacio_emissions, :potencia_contractada, :electricitat_consum_anual, :electricitat_emissions, :electricitat_preu, :electricitat_estimacio_consum_millores, :gas_consum_anual, :gas_emissions, :gas_preu, :gas_estimacio_consum_millores, :gasoil_consum_anual, :gasoil_emissions, :gasoil_preu, :gasoil_estimacio_consum_millores, :calefaccio_font_energia, :calefaccio_percentatge_consum, :calefaccio2_font_energia, :calefaccio2_percentatge_consum, :acs_font_energia, :acs_percentatge_consum, :refrigeracio_percentatge_consum, :iluminacio_percentatge_consum, :electrodomestics_percentatge_consum)
    end
end
