
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/cupertino.dart';

class WebSocketExample extends StatefulWidget {
  @override
  _WebSocketExampleState createState() => _WebSocketExampleState();
}

class _WebSocketExampleState extends State<WebSocketExample> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'), // Replace with your WebSocket URL
  );

  final _controller = TextEditingController();
  String _receivedMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WebSocket Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Send a message'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  _channel.sink.add(_controller.text); // Send message
                }
              },
              child: Text('Send'),
            ),
            SizedBox(height: 20),
            StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Waiting for messages...');
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  _receivedMessage = snapshot.data.toString();
                  return Text('Received: $_receivedMessage');
                } else {
                  return Text('No messages received yet.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _channel.sink.close(); // Close the WebSocket connection
    _controller.dispose();
    super.dispose();
  }
}
