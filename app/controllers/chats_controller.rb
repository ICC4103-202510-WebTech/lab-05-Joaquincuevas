class ChatsController < ApplicationController
    before_action :authenticate_user!
    def index
        @chats = Chat.for_user(current_user.id)
    end

    def show
        @chat = Chat.find(params[:id])
    end

    def edit
        @chat = Chat.find(params[:id])
    end

    def update
    if @chat.update(chat_params)
        redirect_to @chat, notice: "Chat was successfully updated."
    else
        render :edit, status: :unprocessable_entity
    end
    end

    def new
        @chat = Chat.new
    end

    def create
        @chat = Chat.new(chat_params)
        @chat.sender_id = current_user.id
        authorize! :create, @chat
        if @chat.save
            redirect_to @chat, notice: 'Chat was successfully created.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def chat_params
        params.require(:chat).permit(:receiver_id)
    end
end