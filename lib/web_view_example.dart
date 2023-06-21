import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class MyWebView extends StatelessWidget {
  final String title;
  final String selectedUrl;

  // final Completer<WebViewController> _controller = Completer<WebViewController>();

  MyWebView({
    required this.title,
    required this.selectedUrl,
  });
  final WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
  NavigationDelegate(
  onProgress: (int progress) {
  // Update loading bar.
  },
  onPageStarted: (String url) {},
  onPageFinished: (String url) {},
  onWebResourceError: (WebResourceError error) {},
  onNavigationRequest: (NavigationRequest request) {
  if (request.url.startsWith('https://flutter.dev')) {
  return NavigationDecision.prevent;
  }
  return NavigationDecision.navigate;
  },
  ),
  )
  ..loadRequest(Uri.parse('https://flutter.dev'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: WebViewWidget(
          controller: controller,
          layoutDirection: TextDirection.rtl,
          // initialUrl: selectedUrl,
          // javascriptMode: JavascriptMode.unrestricted,
          // onWebViewCreated: (WebViewController webViewController) {
          //   _controller.complete(webViewController);
          // }, controller: _controller,
        ));
  }
}