import 'dart:js_interop';

@JS()


@JS('downloadFile')
external void downloadFile(String url, String filename);
