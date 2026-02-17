# 🤖 Chatbot App with Gemini
A simple and clean Flutter chatbot application using Gemini API for AI responses. Users can send messages, receive AI replies, and see message statuses.


## 🌟 Features
- **Clean Code & Architecture**: Code is fully separated into logical components, making it easy to read, maintain, and extend.
- **No Hard Dependencies**: No reliance on external classes or libraries; any part can be swapped or modified with minimal effort.
- **Cubit State Management**: Simple, predictable, and lightweight state management for handling chat messages and UI updates.
- **Gemini API Integration**: Customizable request and response models to communicate with the Gemini AI API efficiently.
- **Real-time Message Handling**: Messages display immediately when sent, show status indicators (sending 🕓, sent ✅, failed ❌), and support retry for failed messages.
- **Typing Indicator**: Visual feedback while the AI is generating a response.
- **Responsive & Adaptive UI**: Optimized for different screen sizes, ensuring a consistent user experience.
- **Easy to Extend**: Adding new features is easy.


## 🚀 Usage
To run this project, you need to set up your environment variables:

1. Create a `.env` file in the **assets/env/.env** directory of the project.
2. Add the following keys to your `.env` file:

```env
BASE_URL="https://generativelanguage.googleapis.com/"
GEMINI_API_KEY="YOUR_GEMINI_API_KEY_HERE"
```
🔑 How to get your API Key?
1. Go to the [Google Ai Studio](https://ai.google.dev/gemini-api/docs/text-generation).
2. Log in with your Google account.
3. Click on "Get API key" in the sidebar.
4. Copy your key and paste it into the .env file.

## 🏛️ Architecture
- `Cubit` for state management.
- `ChatMessage` entity represents messages.
- `GeminiRequestModel` and `GeminiResponseModel` handle API communication.
- UI separated into widgets: ChatInputField, MessagesList, MessageBubble, TypingIndicator, SuggestionsContent.


## 🛠️ Dependencies
- flutter_bloc: ^9.1.1
- shared_preferences: ^2.5.4
- get_it: ^9.2.0
- dartz: ^0.10.1
- dio: ^5.9.1
- internet_connection_checker: ^3.0.1


## 💻 Installation

Clone the repository:
```bash
git clone https://github.com/DevMoAbdeen/chatbot.git
```

Navigate to the project directory:
```bash
cd chatbot
```

Install dependencies:
```bash
flutter pub get
```

Run the app on your connected device or emulator:
```bash
flutter run
```