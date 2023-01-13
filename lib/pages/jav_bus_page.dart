import 'package:av_manage/util/dio_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';

class JavBusPage extends StatefulWidget {
  const JavBusPage({Key? key}) : super(key: key);

  @override
  State<JavBusPage> createState() => _JavBusPageState();
}

class _JavBusPageState extends State<JavBusPage> {
  late Future<Response> request;
  dom.Document? document;

  @override
  void initState() {
    DioUtil()
        .dio
        .get('https://www.javbus.com/',
            options: Options(
                // contentType: ContentType.html.value,
                // headers: {
                //   'user-agent':
                //   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36 Edg/106.0.1370.42'
                // },
                responseType: ResponseType.plain))
        .then((value) => setState(() {
              document = parse(value.data);
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var waterfall = document?.body?.querySelector('div#waterfall');

    // print('fall: ${waterfall?.text}');
    var items = waterfall?.querySelectorAll('a');
    var images = [];
    items?.forEach((element) {
      var title = element.querySelector('span')?.firstChild?.text;
      print('title: $title');
      var img = element.querySelector('img')?.attributes['src'];
      print('img: $img');
      images.add('https://www.javbus.com$img');
      var tag = element.querySelectorAll('date');
      print('tag: ${tag[0].text}');
      print('time: ${tag[1].text}');
    });
    return SingleChildScrollView(
      child: Center(
        child: document == null
            ? CupertinoActivityIndicator()
            : MasonryGridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                shrinkWrap: true,
                itemCount: images.length,
                itemBuilder: (_, index) {
                  return Image.network(
                    images[index],
                    width: 200,
                    height: 300,
                  );
                }),
      ),
    );
  }
}
