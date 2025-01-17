import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_qurbani/utils/helper/pagination_through_getx.dart';

class PaginationScreen extends StatelessWidget {
  PaginationScreen({super.key});

  final PaginationController controller = Get.put(PaginationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination Example with Getx'),
      ),
      body: Obx(() {
        return Stack(
          children: [
            ListView.builder(
              controller: controller.scrollController, // Correct usage here
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item ${controller.items[index]}'),
                );
              },
            ),
            if (controller.isLoading.value)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}
