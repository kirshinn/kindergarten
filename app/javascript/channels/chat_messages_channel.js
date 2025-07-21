import consumer from "channels/consumer"

consumer.subscriptions.create("ChatMessagesChannel", {
  connected() {
    console.log("✅ ChatMessagesChannel is subscribed")
  },

  disconnected() {
    console.log("❌ ChatMessagesChannel disconnected")
  },

  received(data) {
    console.log("📥 Received:", data)
  }
});
