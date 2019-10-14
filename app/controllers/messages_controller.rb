class MessagesController < ApplicationController
  def show
    if logged_in? && current_user.id == 2
      @message = Message.find(params[:id])
      @picks = @message.picks.all
    else
      redirect_to root_path
    end
  end

  def destroy
    Message.find(params[:id]).destroy
    # flash[:success] = "User deleted"
    redirect_to messages_url
  end

  def new
    if logged_in? && current_user.id == 2
      @message = Message.new
    else
      redirect_to root_path
    end
  end

  def create
    @message = Message.new(message_params)    # Не окончательная реализация!
    if @message.save
      redirect_to @message
    else
      render 'new'
    end
  end

  def index
    if logged_in? && current_user.id == 2
      @messages = Message.all
    else
      redirect_to root_path
    end
  end

  def edit
    if logged_in? && current_user.id == 2
      @message = Message.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(message_params)
      redirect_to @message
    else
      render 'edit'
    end
  end

  private

    def message_params
      params.require(:message).permit(:value, :comment)
    end
end
