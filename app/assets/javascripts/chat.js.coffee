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
    console.log 'sendMessage'
    msgName = $('#name').val()
    msgBody = $('#comment').val()
    @dispatcher.trigger 'new_message', { name: msgName, body: msgBody }
    $('#comment').val('')

  receiveMessage: (message) =>
    console.log message
    parsed_message = "#{message.name}: #{message.body}"
    message_li = $('<li>').text(parsed_message)
    $('#chat_area').append(message_li)

$ ->
  window.chatClass = new ChatClass($('#chat_area').data('uri'), true)
    
