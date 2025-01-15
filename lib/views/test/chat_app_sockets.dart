import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatApp extends StatefulWidget {
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'), // Replace with your WebSocket URL
  );

  final _controller = TextEditingController();
  List<String> _messages = []; // List to store chat messages
  String _username = 'User 1'; // Simulate two users: User 1 and User 2

  // Toggle username between User 1 and User 2
  void _toggleUser() {
    setState(() {
      _username = _username == 'User 1' ? 'User 2' : 'User 1';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Two-User Chat')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Toggle User Button
            ElevatedButton(
              onPressed: _toggleUser,
              child: Text('Switch to $_username'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_messages[index]),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _sendMessage(_controller.text);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to send a message to the WebSocket server
  void _sendMessage(String message) {
    _channel.sink.add(message);
    setState(() {
      _messages.add('$_username: $message'); // Add message with user identifier
    });
    _controller.clear(); // Clear the input field
  }

  @override
  void initState() {
    super.initState();

    // Listen for incoming messages
    _channel.stream.listen((message) {
      setState(() {
        _messages.add('Other User: $message'); // Add server response as the other user's message
      });
    });
  }

  @override
  void dispose() {
    _channel.sink.close(); // Close the WebSocket connection
    _controller.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: ChatApp(),
  ));
}
