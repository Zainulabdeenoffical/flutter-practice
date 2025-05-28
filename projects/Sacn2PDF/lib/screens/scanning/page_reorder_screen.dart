import 'package:flutter/material.dart';

class PageReorderScreen extends StatefulWidget {
  const PageReorderScreen({Key? key}) : super(key: key);

  @override
  _PageReorderScreenState createState() => _PageReorderScreenState();
}

class _PageReorderScreenState extends State<PageReorderScreen> {
  List<String> pages = List.generate(10, (index) => "Page ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reorder Pages"),
      ),
      body: ReorderableListView(
        children: [
          for (int i = 0; i < pages.length; i++)
            ListTile(
              key: ValueKey(i),
              title: Text(pages[i]),
              leading: const Icon(Icons.picture_as_pdf),
            ),
        ],
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = pages.removeAt(oldIndex);
            pages.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
