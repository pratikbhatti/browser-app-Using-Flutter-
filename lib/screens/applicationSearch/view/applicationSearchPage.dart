import 'package:demo29/screens/application/provider/applicationProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class ApplicationSearchPage extends StatefulWidget {
  const ApplicationSearchPage({super.key});

  @override
  State<ApplicationSearchPage> createState() => _ApplicationSearchPageState();
}

class _ApplicationSearchPageState extends State<ApplicationSearchPage> {
  ApplicationProvider? providerTrue;
  ApplicationProvider? providerFalse;
  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<ApplicationProvider>(context, listen: true);
    providerFalse = Provider.of<ApplicationProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse('${providerFalse!.link}'),
          ),
          // onWebViewCreated: (controller) {
          //   providerFalse!.inAppWebViewController = controller;
          // },
          // onProgressChanged: (controller, progress) {
          //   providerFalse!.changeProgress(progress / 100);
          // },
        ),
      ),
    );
  }
}
