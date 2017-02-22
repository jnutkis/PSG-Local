class MessagesController < ApplicationController

    def new
        @message = Message.new
    end


    def create
        @message = Message.new(message_create_params)
        if @message.save
            @message.update_attribute(:submitted_date, Time.zone.now)
            @message.send_message_to_support
            flash[:success] = "Message Submitted. Please allow one full business to receive a reply."
            render 'new'
        else
            flash[:danger] = @message.errors.full_messages.to_sentence
            render 'new'
        end
    end


  private
  def message_create_params
    params.require(:messages).permit(:email, :message)
  end

end
