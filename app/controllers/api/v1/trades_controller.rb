# frozen_string_literal: true

class Api::V1::TradesController < ApplicationController
  # GET /api/v1/trades
  def index
    @trades = Trade.all
    render json: @trades
  end

  # POST /api/v1/trades
  def create
    trade = Trade.create(trade_params)
    if trade.save
      render json: trade
    else
      render json: trade.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/trades/1
  def destroy
    trade.destroy
  end

  private

  def trade
    @trade ||= Trade.find(params[:id])
  end

  def trade_params
    params.permit(:currency, :amount, :date_of_purchase, :note)
  end
end
