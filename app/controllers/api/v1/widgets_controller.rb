class Api::V1::WidgetsController < ApiController
  def show
    widget = Widget.find(params[:id])
    # Note that rails automatically calls to_json for you
    render json: { widget: }
  end
end
