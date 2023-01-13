import 'package:av_manage/logic/app_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class DockerPage extends StatefulWidget with GetItStatefulWidgetMixin {
  DockerPage({Key? key}) : super(key: key);

  @override
  State<DockerPage> createState() => _DockerPageState();
}

class _DockerPageState extends State<DockerPage> with GetItStateMixin {
  String content = '';

  @override
  void initState() {
    super.initState();
  }

  initDocker() async {
    // var psContainerNames = await dockerCommander.psContainerNames();
    // var daysStart = await dockerCommander.startContainer('7DaysToDie');
    // print('daysStart: $daysStart');
    // print(psContainerNames);
    // psContainerNames?.forEach((element) async {
    //   print('$element: ${await dockerCommander.getContainerIP(element)}');
    // });
    // var dockerContainer =
    //     await dockerCommander.getFormulaClassName('7DaysToDie');
    // content = dockerContainer ?? '';
    // Run Docker image `hello-world` (at remote server):
    // var dockerContainer = await dockerCommander.run('hello-world');

    // The behavior is the same of the example using `DockerHostLocal`.
    // The internal `DockerRunner` will sync remote output (stdout/sdterr) automatically!

    // ...

    // Gets all the STDOUT as [String].
    // var output = dockerContainer?.stdout?.asString;
    // print(dockerContainer);
  }

  @override
  Widget build(BuildContext context) {
    var commander = get<AppLogic>().dockerCommander;
    var hostRemote = get<AppLogic>().dockerHostRemote;
    var runnersInstanceIDs = hostRemote.getRunnersInstanceIDs();
    var runnersNames = hostRemote.getRunnersNames();
    runnersInstanceIDs.forEach((element) {
      print('runnersInstanceIDs: $element');
    });
    runnersNames.forEach((element) {
      print('runnersNames: $element');
    });
    return Center(
      child: GridView.builder(
        itemCount: runnersInstanceIDs.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            childAspectRatio: 16 / 9),
        itemBuilder: (BuildContext context, int index) {
          // var containerName = runnersInstanceIDs[index];
          var item =
              hostRemote.getRunnerByInstanceID(runnersInstanceIDs[index]);

          // var runnerByName = get<AppLogic>()
          //     .dockerHostRemote.
          //     .getRunnerByName(containerName);
          return ListTile(
            title: Text('${item?.containerName}'),
            // leading: commander.isContainerARunner(containerName)
            //     ? const Icon(Icons.open_in_browser)
            //     : const Icon(Icons.close),
            // leading: FutureBuilder(
            //   // future: commander..,
            //   // future: get<AppLogic>().dockerHostRemote.getRunnerByName(containerName),
            //   future: commander.getContainerIP(containerName),
            //   builder: (BuildContext context,
            //       AsyncSnapshot<String?> snapshot) {
            //     if (snapshot.hasData) {
            //       print("snapshot: ${snapshot.data}");
            //       return Icon(snapshot.data! != 'null'
            //           ? Icons.open_in_browser
            //           : Icons.close);
            //     }
            //     return const Icon(Icons.close);
            //   },
            // ),
          );
        },
      ),
    );
  }
}
