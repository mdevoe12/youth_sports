class ConversationsController < ApplicationController
  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]


  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
    @users = User.all
  end

  def show
    @conversation = Conversation.find_by(id: params[:id])
    @personal_message = PersonalMessage.new
  end

  private

  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end

  def check_participating!
    redirect_to "conversations#index" unless @conversation &&
    @conversation.participates?(current_user)
  end

end
