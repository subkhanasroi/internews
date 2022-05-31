import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewNewsPage extends StatefulWidget {
  String url;

  WebViewNewsPage({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewNewsPage> createState() => _WebViewNewsPageState();
}

class _WebViewNewsPageState extends State<WebViewNewsPage> {
  @override
  void initState() {
    super.initState();
    if (GetPlatform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}
