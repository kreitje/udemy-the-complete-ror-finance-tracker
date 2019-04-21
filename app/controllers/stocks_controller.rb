# frozen_string_literal: true

class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:danger] = 'No stock symbol entered'
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = 'You have entered an invalid symbol' unless @stock
    end

    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
end
