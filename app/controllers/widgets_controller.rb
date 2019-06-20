class WidgetsController < ApplicationController
  skip_before_action :verify_authenticity_token, :authenticate_user!
  after_action :allow_iframe
  # layout 'widget_layout', only: [:widget]
  # layout 'widget_layout_2', only: [:widget_2]

  def widget
    @lead = Lead.new
    respond_to do |format|
      format.html do
        # load data to show in the view
        # @data = ...
        render :widget, :layout => 'widget_layout'
      end
      format.js do
        render :widget
      end
    end
  end

    def widget_2
    @lead = Lead.new
    respond_to do |format|
      format.html do
        # load data to show in the view
        # @data = ...
        render :widget_2, :layout => 'widget_layout_2'
      end
      format.js do
        render :widget_2
      end
    end
  end

  def test_widget
    render :test_widget, layout: false
  end

  private

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

  def get_rumours
    if params[:id]
      Rumour.displayed.where(id: params[:id])
    else
      Rails.cache.fetch('rumours_for_widget', expires_in: 5.minutes) do
       Rumour.order(timestamp: :desc).displayed.limit(5)
      end
    end
  end
end
