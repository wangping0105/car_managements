class Api::V1::BaseController < ActionController::Base
  include Api::Rescueable

  helper_method :current_user
  before_action :authenticate!

  respond_to :json

  protected

  def set_default_page_params
    params[:page] ||= 1
    params[:per_page] ||= Kaminari.config.default_per_page
  end

  def normal_render(code = 0, data = nil)
    _result = {code: code}
    _result = _result.merge(data: data) if data.present?
    render json: _result
  end
end
