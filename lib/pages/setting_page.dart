import 'package:av_manage/main.dart';
import 'package:av_manage/router.dart';
import 'package:flutter/material.dart';
import 'package:system_network_proxy/system_network_proxy.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                appRouter.pop();
              },
              child: Text('Back')),
          ElevatedButton(onPressed: () {}, child: const Text('系统代理')),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text('getProxyEnable'),
                onPressed: () async {
                  var proxyEnable = await SystemNetworkProxy.getProxyEnable();
                  scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
                    content: Text('getProxyEnable: $proxyEnable'),
                  ));
                },
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text('getProxyServer'),
                onPressed: () async {
                  var proxyServer = await SystemNetworkProxy.getProxyServer();
                  scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
                    content: Text('getProxyServer: $proxyServer'),
                  ));
                },
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text('setProxyEnable'),
                onPressed: () async {
                  var proxyEnable = await SystemNetworkProxy.setProxyEnable(
                      !(await SystemNetworkProxy.getProxyEnable()));
                  scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
                    content: Text('getProxyEnable: $proxyEnable'),
                  ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
