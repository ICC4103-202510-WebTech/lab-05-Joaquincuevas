class MessagesController < ApplicationController
    before_action :authenticate_user!
    def index
        @messages = Message.all
    end

    def show
        @message = Message.find(params[:id])
    end

    def edit
        @message = Message.find(params[:id])
    end

    def new
    @message = Message.new
    @chats = Chat.where(sender_id: current_user.id)
    end
    def update
        if @message.update(message_params)
            redirect_to @message, notice: "Message was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def create
    @message = Message.new(message_params)
    # Ensure the chat belongs to the current user as sender
    chat = Chat.find(@message.chat_id)
    unless chat.sender_id == current_user.id
        redirect_to new_message_path, alert: "You can only send messages as the sender of the chat."
        return
    end
    @message.user = current_user # If the author is always the logged-in user
    if @message.save
        redirect_to @message, notice: "Message was successfully created."
    else
        @chats = Chat.where(sender_id: current_user.id)
        render :new
    end
    end

    private

    def message_params
        params.require(:message).permit(:body, :chat_id, :user_id)
    end
end