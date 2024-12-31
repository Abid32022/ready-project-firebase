import 'dart:isolate';
import 'package:flutter/material.dart';

class IsolateScreen extends StatelessWidget {
  const IsolateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/Animation - 1735521227751.gif'),
              //Blocking UI task
              ElevatedButton(
                onPressed: () async {
                  var total = await complexTask1();
                  debugPrint('Result 1: $total');
                },
                child: const Text('Task 1'),
              ),
              //Isolate
              ElevatedButton(
                onPressed: () async {
                  final receivePort = ReceivePort();
                  await Isolate.spawn(complexTask2, receivePort.sendPort);
                  receivePort.listen((total){
                    debugPrint(total.toString());
                  });
                },
                child: const Text('Task 2'),
              ),
              ElevatedButton(
                onPressed: () async{
                  final recieveport = ReceivePort();
                  await Isolate.spawn(complexTask3, recieveport.sendPort);
                  recieveport.listen((total){
                    debugPrint(total.toString());
                  });
                },
                child: const Text('Task 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<double> complexTask1() async {
    var total = 0.0;
    for (var i = 0; i < 1000000000; i++) {
      total += i;
    }
    return total;
  }

}
//--End of HomePage--
complexTask3(SendPort sendport) async {
  var total = 0.0;
  for (var i = 0; i < 1000000000; i++) {
    total += i;
  }
  return sendport.send(total.toDouble());
}

complexTask2(SendPort sendPort) {
  var total = 0.0;
  for (var i = 0; i < 1000000000; i++) {
    total += i;
  }
  sendPort.send(total.toDouble());
}