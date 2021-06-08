import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {

    window.messageContainer = document.getElementById('message-container')
    window.addMessage = document.getElementById('add-message')
    if (messageContainer === null) {
        return
    }

    consumer.subscriptions.create("RoomChannel", {
        connected() {
        },

        disconnected() {
        },

        received(data) {

            addMessage.insertAdjacentHTML('beforeend',  data['message'])

        },
    })
    const documentElement = document.getElementById('scroll-message')
    window.scrollToBottom = () => {
      documentElement.scrollTop = documentElement.scrollHeight;
    };
    scrollToBottom()
})