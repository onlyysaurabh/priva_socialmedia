import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:Priva/common/utils/colors.dart';

class FeedWebView extends StatefulWidget {
  String url;
  FeedWebView({super.key, required this.url});

  @override
  State<FeedWebView> createState() => _FeedWebViewState();
}

class _FeedWebViewState extends State<FeedWebView> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
        backgroundColor: backgroundColor,
      ),
    );
  }
}
