class WaybillsController < ApplicationController
  before_action :set_waybill, only: [:show, :edit, :update, :destroy, :accept, :reject, :yiqu, :submit_items]

  # GET /waybills
  # GET /waybills.json
  def index
    @pickup_waybills = current_courier.pickup_waybills
    @deliver_waybills = current_courier.deliver_waybills
  end

  # GET /waybills/1
  # GET /waybills/1.json
  def show
  end

  # GET /waybills/1/edit
  def edit
  end

  # DELETE /waybills/1
  # DELETE /waybills/1.json
  def destroy
    @waybill.destroy
    respond_to do |format|
      format.html { redirect_to waybills_url, notice: 'Waybill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept
    @waybill.accept!
    respond_to do |format|
      format.html { redirect_to :back, notice: '接单成功.' }
    end
  end

  def reject
    @waybill.reject!
    respond_to do |format|
      format.html { redirect_to :back, notice: '拒单成功.' }
    end
  end

  def yiqu
    respond_to do |format|
      if @waybill.yiqu
        format.html { redirect_to :back, notice: '取件成功.' }
      else
        format.html { redirect_to :back, alert: "取件失败. #{@waybill.errors}" }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waybill
      @waybill = Waybill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waybill_params
      params.fetch(:waybill, {})
    end
  end
