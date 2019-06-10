class LeadsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

def index
  @lead = Lead.new(lead_params)
  respond_to do |format|
        format.html do
          # load data to show in the view
          # @data = ...
          render :widget
        end
        format.js do
          render :widget
        end
      end

  end


def show
end


    def new
    @lead = Lead.new
    respond_to do |format|
          format.html do
            # load data to show in the view
            # @data = ...
            render :widget
          end
          format.js do
            render :widget
          end
        end

    end


  def create
    @lead = Lead.new(params[:lead])
    @lead.save
    # Unless @lead.valid?, #save will return false,
    # and @lead is not persisted.
    # TODO: present the form again with error messages.
    # redirect_to home_path(@lead)
  end

  private

  def lead_params
    params.require(:lead).permit(:first_name, :last_name, :address, :adress_2, :email, :zip, :company)
  end
end