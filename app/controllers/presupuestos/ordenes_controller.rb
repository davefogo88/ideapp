class Presupuestos::OrdenesController < ApplicationController

  # GET /ordenes
  # GET /ordenes.json
  def index
    @ordenes = Ordene.all
  end

  # GET /ordenes/1
  # GET /ordenes/1.json
  def show
  end

  # GET /ordenes/new
  def new
    @presupuesto = Presupuesto.find(params[:presupuesto_id])
    @ordene = Ordene.new
  end

  # GET /ordenes/1/edit
  def edit
    @presupuesto = Presupuesto.find(params[:presupuesto_id])
    @ordene = Ordene.find(params[:id])
    
  end

  # POST /ordenes
  # POST /ordenes.json
  def create
    @presupuesto = Presupuesto.find(params[:presupuesto_id])
    @ordene = Ordene.new(ordene_params)
    @ordene.presupuesto = @presupuesto

    respond_to do |format|
      if @ordene.save
        format.html { redirect_to @presupuesto, notice: 'Ordene was successfully created.' }
        format.json { render :show, status: :created, location: @presupuesto }
      else
        format.html { render :new }
        format.json { render json: @presupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordenes/1
  # PATCH/PUT /ordenes/1.json
  def update
    @presupuesto = Presupuesto.find(params[:presupuesto_id])
     @ordene = Ordene.find(params[:id])
    respond_to do |format|
      if @ordene.update(ordene_params)
        format.html { redirect_to presupuesto_ordenes_url, notice: 'Ordene was successfully updated.' }
        format.json { render :show, status: :ok, location: @ordene }
      else
        format.html { render :edit }
        format.json { render json: @ordene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordenes/1
  # DELETE /ordenes/1.json
  def destroy
    @presupuesto = Presupuesto.find(params[:presupuesto_id])
    @ordene = Ordene.find(params[:id])
    @ordene.destroy
    respond_to do |format|
      format.html { redirect_to presupuesto_url, notice: 'Ordene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordene
      @ordene = Ordene.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordene_params
      params.require(:ordene).permit(:fecha_orden, :medida, :unidad, :costo_unidad, :total, :presupuesto_id, :medio_id, :aprobado_por_cliente, :factura_id, :cantidad, :cobertura, :col, :cm, :descuento, :referencia_preventa, :notas)
    end
end
