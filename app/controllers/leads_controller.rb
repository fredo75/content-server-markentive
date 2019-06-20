require 'rest-client'



class LeadsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
 skip_before_action :verify_authenticity_token, :authenticate_user!
 after_action :allow_iframe
 # after_create :send_welcome_email
  # layout 'widget_layout'

def index
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
    @lead = Lead.new(lead_params)
    # @lead.user_id = 1
    @lead.user_id = params[:user_id]
    params[:lead][:rgpd] == "1" ? @lead.rgpd = true : @lead.rgpd = false
    @lead.save
    render template: "leads/result_submit", layout: false
    # email = @lead
    UserMailer.welcome(@lead).deliver_now



    # @lead.each do |elem|

      # next if elem[:email].nil? || (elem[:email] == " ")
      def hubspot_post


      url_user = 'https://api.hsforms.com/submissions/v3/integration/submit/5187319/1072b70c-a9b7-41ef-8a50-4dc62698cc52'
      @response = RestClient.post url_user,
      {
    "fields": [
      {
        "name": "firstname",
        "value": @lead.first_name
      },
      {
        "name": "lastname",
        "value": @lead.last_name
      },
      {
        "name": "email",
        "value": @lead.email
      },
      {
        "name": "city",
        "value": @lead.city
      },
      {
        "name": "company",
        "value": @lead.company
      },
      {
        "name": "zip",
        "value": @lead.zip
      },
      {
        "name": "address",
        "value": @lead.address
      }
    ],

      "legalConsentOptions":{
        "consent":{
          "consentToProcess":true,
          "text":"I agree to allow Example Company to store and process my personal data.",
          "communications":[
            {
              "value":true,
              "subscriptionTypeId":999,
              "text":"I agree to receive marketing communications from Example Company."
            }
          ]
        }
      }
  }.to_json, {content_type: :json, accept: :json}

      end
      # end



    # {

    #   "fields": [
    #     {
    #       "name": "email",
    #       "value": "frefre@example.com"
    #     },
    #     {
    #       "name": "firstname",
    #       "value": "fefre"
    #     },
    #     {
    #       "name": "lastname",
    #       "value": "dodo"
    #     }
    #   ],

    #   "legalConsentOptions":{
    #     "consent":{
    #       "consentToProcess":true,
    #       "text":"I agree to allow Example Company to store and process my personal data.",
    #       "communications":[
    #         {
    #           "value":true,
    #           "subscriptionTypeId":999,
    #           "text":"I agree to receive marketing communications from Example Company."
    #         }
    #       ]
    #     }
    #   }
    # }


    # Unless @lead.valid?, #save will return false,
    # and @lead is not persisted.
    # TODO: present the form again with error messages.
    # redirect_to home_path(@lead)
  end

  private

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end


  def send_welcome_email
    UserMailer.welcome.deliver_now
  end

  def lead_params
    params.require(:lead).permit(:first_name, :last_name, :address, :address_2, :email, :zip, :company, :city, :user_id)
  end
end
