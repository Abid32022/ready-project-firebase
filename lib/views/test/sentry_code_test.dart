import 'package:flutter/material.dart';
class SentryCodeTest extends StatelessWidget {
  const SentryCodeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40,),
      ElevatedButton(
            onPressed: () {
              throw Exception('This is test exception');
            },
            child: const Text('Verify Sentry Setup'),
          )
        ],
      ),
    );
  }
}
