class Users::ConversationsController < ApplicationController
  before_action :set_conversation, except: [:index]
  before_action :check_participating, except: [:index

  def new
    redirect_to conversation_path(@conversation) and return
    if @conversation
      @personal_message = current_user.personal_messages.built
    end
  end

  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
  end

  def show
    @personal_message = PersonalMessage.new
  end

  private

  def set_conversation
    @conversation = conversation.find_by(id: params[:id])
  end

  def check_participating!
    redirect_to "conversations#index" unless @conversation &&
    @conversation.participates?(current_user)
  end

end
