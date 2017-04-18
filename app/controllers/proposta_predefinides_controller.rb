class PropostaPredefinidesController < ApplicationController
  before_action :set_proposta_predefinida, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  # GET /proposta_predefinides
  # GET /proposta_predefinides.json
  def index
    @proposta_predefinides = PropostaPredefinida.all
  end

  # GET /proposta_predefinides/1
  # GET /proposta_predefinides/1.json
  def show
  end

  # GET /proposta_predefinides/new
  def new
    @proposta_predefinida = PropostaPredefinida.new
  end

  # GET /proposta_predefinides/1/edit
  def edit
  end

  # POST /proposta_predefinides
  # POST /proposta_predefinides.json
  def create
    @proposta_predefinida = PropostaPredefinida.new(proposta_predefinida_params)

    respond_to do |format|
      if @proposta_predefinida.save
        format.html { redirect_to @proposta_predefinida, notice: 'Proposta predefinida was successfully created.' }
        format.json { render :show, status: :created, location: @proposta_predefinida }
      else
        format.html { render :new }
        format.json { render json: @proposta_predefinida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposta_predefinides/1
  # PATCH/PUT /proposta_predefinides/1.json
  def update
    respond_to do |format|
      if @proposta_predefinida.update(proposta_predefinida_params)
        format.html { redirect_to @proposta_predefinida, notice: 'Proposta predefinida was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposta_predefinida }
      else
        format.html { render :edit }
        format.json { render json: @proposta_predefinida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposta_predefinides/1
  # DELETE /proposta_predefinides/1.json
  def destroy
    @proposta_predefinida.destroy
    respond_to do |format|
      format.html { redirect_to proposta_predefinides_url, notice: 'Proposta predefinida was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def select
    #@propostes = Proposta.where(edifici_id: params[:edifici_id])
  end

  def afegeix
    proposta_predefinida = PropostaPredefinida.find(params[:proposta_predefinida_id])
    proposta = Proposta.new
    proposta.edifici_id = params[:edifici_id]
    proposta.nom = proposta_predefinida.nom_ca
    proposta.cost = proposta_predefinida.cost
    proposta.estalvi = proposta_predefinida.estalvi
    proposta.reduccio_emissions = proposta_predefinida.reduccio_emissions
    proposta.retorn_inversio = proposta_predefinida.retorn_inversio
    proposta.save
    @propostes = Proposta.where(edifici_id: params[:edifici_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposta_predefinida
      @proposta_predefinida = PropostaPredefinida.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposta_predefinida_params
      params.require(:proposta_predefinida).permit(:edifici_id, :nom_ca, :nom_es, :descripcio_ca, :descripcio_es, :cost, :estalvi, :reduccio_emissions, :retorn_inversio, :categoria)
    end
end
