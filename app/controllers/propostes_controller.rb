class PropostesController < ApplicationController
  include CheckUser
  before_action :set_proposta, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici, only: [:index]
  respond_to :html, :js

  def index
    @subnavigation = true
    @submenu_actiu = 'propostes'
    @propostes = Proposta.where(edifici_id: params[:edifici_id])
    check_user_edifici(params[:edifici_id])
  end

  def new
    @proposta = Proposta.new
    @proposta.edifici_id = params[:edifici_id]
  end

  def edit
  end

  def create
    @proposta = Proposta.create(proposta_params)
    @propostes = Proposta.where(edifici_id: @proposta.edifici_id).order(created_at: :asc)
  end

  def update
    @proposta.update_attributes(proposta_params)
    @propostes = Proposta.where(edifici_id: @proposta.edifici_id).order(created_at: :asc)
  end

  def destroy
    @propostes = Proposta.where(edifici_id: @proposta.edifici_id).order(created_at: :asc)
    @proposta.destroy
  end

  def exporta_xml
    @edifici = Edifici.find(params[:edifici_id])
    @propostes = Proposta.where(edifici_id: params[:edifici_id])
    respond_to do |format|
      format.xml do
        builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
          xml.edifici {
            xml.app "Test energètic"
            xml.edifici_id @edifici.id
            @propostes.each do |proposta|
              xml.proposta {
                xml.nom proposta.nom
                xml.descripcio proposta.descripcio
                xml.cost proposta.cost
                xml.estalvi proposta.estalvi
                xml.reduccio_emissions proposta.reduccio_emissions
                xml.retorn_inversio proposta.retorn_inversio
              }
            end
          }
        end
        send_data builder.to_xml, filename: "#{@edifici.nom_edifici}.xml"
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposta
      @proposta = Proposta.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposta_params
      params.require(:proposta).permit(:edifici_id, :nom, :descripcio, :cost, :estalvi, :reduccio_emissions, :retorn_inversio)
    end
end
