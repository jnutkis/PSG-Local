class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.message_submitted.subject
  #
  def message_submitted
    @message = message

    mail to: "james.nutkis@hitrustalliance.net", subject: "Products and Services Message Received"
  end
end
