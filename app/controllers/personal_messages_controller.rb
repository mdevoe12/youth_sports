class PersonalMessagesController < ApplicationController
  before_action :find_conversation!

  def create
    @personal_message = current_user.personal_messages.build(personal_message_params)
    @personal_message.conversation_id = @conversation.id
    @personal_message.save!

    flash[:success] = "Your message was sent"
    redirect_to "conversations#index"
  end

  private

  def personal_message_params
    params.require(:personal_message).permit(:body)
  end

  def find_conversation!
    @conversation = Conversation.find_by(id: params[:conversation_id])
    redirect_to("conversations#index") and return unless @conversation &&
    @converstion.participates?(current_user)
  end
end
