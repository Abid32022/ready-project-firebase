import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class FilePickerApp extends StatefulWidget {
  const FilePickerApp({super.key});

  @override
  State<FilePickerApp> createState() => _FilePickerAppState();
}

class _FilePickerAppState extends State<FilePickerApp> {
  final List<File> _savedFiles = [];

  /// Select files using FilePicker
  Future<void> selectFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;

    for (var platformFile in result.files) {
      final file = File(platformFile.path!);
      final savedFile = await saveFilePermanently(file);
      setState(() {
        _savedFiles.add(savedFile);
      });
    }
  }

  /// Save file permanently in app's documents directory
  Future<File> saveFilePermanently(File file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.uri.pathSegments.last}');
    return file.copy(newFile.path);
  }

  /// Open a file
  void openFile(File file) {
    OpenFile.open(file.path);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("File Picker App"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: selectFiles,
            child: const Text("Select Files"),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: _savedFiles.isEmpty
                ? const Center(child: Text("No files selected"))
                : ListView.builder(
              itemCount: _savedFiles.length,
              itemBuilder: (context, index) {
                final file = _savedFiles[index];
                final savedFileName = file.uri.pathSegments.last;

                return ListTile(
                  title: Text(
                    savedFileName,
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: ElevatedButton(
                    child: Text("Open File"),
                    onPressed: () => openFile(file),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
