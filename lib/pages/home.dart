import 'package:av_manage/pages/jav_bus_page.dart';
import 'package:av_manage/util/file_util.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final XFile? file = await openFile(
              acceptedTypeGroups: <XTypeGroup>[videoGroup, allGroup]);
        },
        child: const Icon(Icons.add),
      ),
      body: JavBusPage(),
    );
  }
}
