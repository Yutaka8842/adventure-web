import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {

    window.messageContainer = document.getElementById('message-container')
    window.addMessage = document.getElementById('add-message')
    window.scrollToBottom = () => {
      documentElement.scrollTop = documentElement.scrollHeight;
    };
    if (messageContainer === null) {
        return
    }

    consumer.subscriptions.create("RoomChannel", {
        connected() {
        },

        disconnected() {
        },

        received(data) {
            var str = data['message']
            var message = str.replace( 'http://example.org', 'https://adventure-web.com' );
            addMessage.insertAdjacentHTML('beforeend',  message)
            scrollToBottom()
        },
    })
    const documentElement = document.getElementById('scroll-message')
    window.messageContent = document.getElementById('message_content')
    scrollToBottom()
})