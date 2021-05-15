class MessagesController < ApplicationController
  def new
  end

  def create
    @message = Message.new(text: params[:message][:text])
  end
end
