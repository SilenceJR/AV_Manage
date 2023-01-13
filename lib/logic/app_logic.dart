import 'package:av_manage/router.dart';
import 'package:docker_commander/docker_commander.dart';

class AppLogic {
  late DockerHostRemote dockerHostRemote;
  late DockerCommander dockerCommander;

  Future<void> bootstrap() async {
    // dockerHostRemote = DockerHostRemote('silence.host', 28099,
    //     username: 'Silence', password: 'PJhk02261993');
    // dockerCommander = DockerCommander(dockerHostRemote);

    // Initialize `DockerCommander` (at remote server):
    // await dockerCommander.initialize();
    // // Ensure that Docker daemon is running (at remote server):
    // await dockerCommander.checkDaemon();

    // if (dockerHostRemote.isSuccessfullyInitialized) {
    //   appRouter.go(AppPath.cpu);
    // }
    appRouter.go(AppPath.cpu);
  }
}
