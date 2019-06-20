class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
def welcome(lead)

    @lead_email = lead.email
    @greeting = lead.first_name

    mail(
      :subject => 'Hello from Postmark',
      :to  => @lead_email,
      :from => 'frederic.curier@markentive.com',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end
end
