class ChatController < WebsocketRails::BaseController
  def initialize_session
    puts '***********init***********'
  end

  def connect_user
    puts '********connected********'
  end

  def new_message
    broadcast_message :new_message, message
  end
end
