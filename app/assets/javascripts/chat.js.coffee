class @ChatClass
  constructor: (url, useWebsocket) ->
    @dispatcher = new WebSocketRails(url, useWebsocket)
    console.log(url)
    @bindEvents()

  bindEvents: () =>
    $('#send').on 'click', @sendMessage
    @dispatcher.bind 'new_message', @receiveMessage
    console.log('*****')

  sendMessage: (event) =>
    msgBody = $('#comment').val()
    @dispatcher.trigger 'new_message', { body: msgBody }
    $('#comment').val('')

  receiveMessage: (message) =>
    console.log message
    message_li = $('<li>').text(message.body)
    $('#chat_area').append(message_li)

$ ->
  window.chatClass = new ChatClass($('#chat_area').data('uri'), true)
    
