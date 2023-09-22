class WidgetsController < ApplicationController
  def index
    @widgets = [
      OpenStruct.new(id: 1, name: 'Stembolt'),
      OpenStruct.new(id: 2, name: 'Flux Capacitor')
    ]
  end

  def show
    manufacturer = OpenStruct.new(
      id: rand(100),
      name: 'Sector 7G',
      address: OpenStruct.new(
        id: rand(100),
        country: 'UK'
      )
    )

    @widget = OpenStruct.new(
      id: params[:id],
      manufacturer_id: manufacturer,
      manufacturer: manufacturer,
      # manufacturer_name: "Sector 7G",
      # manufacturer_country: "UK",
      name: "Widget #{params[:id]}"
    )

    @widget.instance_eval do
      def widget_id
        if id.to_s.length < 3
          id.to_s
        else
          "#{id.to_s[..-3]}.#{id.to_s[-2..]}"
        end
      end
    end

    # @widget_presenter = WidgetPresenter.new(widget)
  end
end
