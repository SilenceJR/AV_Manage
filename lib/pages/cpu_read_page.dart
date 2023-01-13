import 'package:cpu_reader/cpuinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:system_info2/system_info2.dart';

class CpuReadPage extends StatelessWidget with GetItMixin {
  CpuReadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cores = SysInfo.cores;
    return ListView.builder(
      itemCount: cores.length,
      itemBuilder: (BuildContext context, int index) {
        var core = cores[index];
        return Column(
          children: [
            Text('${core.name}'),
            Text('${core.architecture}'),
            Text('${core.socket}'),
            Text('${core.vendor}'),
            Text('cpu : $index'),
          ],
        );
      },
    );
    // return StreamBuilder(
    //   stream: CpuReader.cpuStream(1000),
    //   builder: (BuildContext context, AsyncSnapshot<CpuInfo> snapshot) {
    //     if (snapshot.hasData) {
    //       var cpuInfo = snapshot.data!;
    //       return Text("Temperature: ${cpuInfo.cpuTemperature}");
    //     }
    //     return const CupertinoActivityIndicator();
    //   },
    // );
  }
}
