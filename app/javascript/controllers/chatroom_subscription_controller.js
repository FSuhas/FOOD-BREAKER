import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number, userId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: (data) => {
        if (data.user_id == this.userIdValue){
          this.messagesTarget.insertAdjacentHTML("beforeend", data.html)
        } else {
          this.messagesTarget.insertAdjacentHTML("beforeend", data.html)
          console.log(Array.from(this.messagesTarget.children))
          const elements = Array.from(this.messagesTarget.children)
          const element = elements[elements.length -1]
          element.classList.remove('msg-info-sender')
          element.classList.add('msg-info-receiver')
        }
      }}
    )
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
