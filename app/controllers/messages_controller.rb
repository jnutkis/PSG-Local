class MessagesController < ApplicationController

    def new
        @message = Message.new
    end


    def create
        @message = Message.new(message_create_params)
        if @message.save
            @message.update_attribute(:submitted_date, Time.zone.now)
            @message.send_message_to_support
            flash[:success] = "Message successfully submitted. Please allow one (1) full business day to receive a response."
            redirect_to new_message_path
        else
            flash[:danger] = @message.errors.full_messages.to_sentence
            redirect_to new_message_path
        end
    end


  private
  def message_create_params
    params.require(:message).permit(:email, :message)
  end

end
