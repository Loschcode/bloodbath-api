class CoinTrackingsController < ApplicationController
  attr_reader :coin_trackings, :coin_tracking

  before_action :authenticated?

  before_action :set_coin_tracking

  def update
    unless coin_tracking.update(coin_tracking_params)
      throw_error "#{coin_tracking.errors.full_messages.join(', ')}"
      return
    end

    throw_success coin_tracking: coin_tracking
  end

  private

  def coin_tracking_params
    params[:coin_tracking].permit!
  end

  def set_coin_tracking
    @coin_tracking = CoinTracking.find(params[:id])
  end

end
