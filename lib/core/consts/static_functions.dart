// ignore: avoid_web_libraries_in_flutter
import "dart:html" as html; //Only for web
import "dart:io" as io;
import "package:flutter/foundation.dart";
import "package:intl/intl.dart";

import "../../data/models/logged_in_user.dart";

Future<void> downloadFile(final String url, final String description) async {
  ///Accept the url and description for naming
  try {
    final String? token = LoggedInUser.accessToken;

    String fileExtension = url.split(".").last.split("?").first;
    if (!RegExp(r"^[a-zA-Z0-9]+$").hasMatch(fileExtension)) {
      fileExtension = "file";
    }

    final String sanitizedDescription =
        description.replaceAll(RegExp(r'[\\/:*?"<>|]'), '_');
    final String currentDateTime =
        DateFormat("MM_dd_yyyy_hh:mm a").format(DateTime.now());
    final String fileName =
        "$sanitizedDescription-$currentDateTime.$fileExtension";

    if (kIsWeb) {
      final html.HttpRequest request = await html.HttpRequest.request(
        url,
        method: "GET",
        requestHeaders: <String, String>{
          "Authorization": "Bearer $token",
        },
        responseType: "blob",
      );

      if (request.status == 200) {
        final html.Blob blob = request.response;

        final String blobUrl = html.Url.createObjectUrlFromBlob(blob);
        final html.AnchorElement anchor = html.AnchorElement(href: blobUrl)
          ..setAttribute("download", fileName)
          ..style.display = "none";
        html.document.body?.append(anchor);
        anchor.click();
        anchor.remove();
        html.Url.revokeObjectUrl(blobUrl);
      } else {
        throw Exception("Failed to download file: ${request.status}");
      }
    } else {
      final Uri uri = Uri.parse(url);
      final io.HttpClient client = io.HttpClient();
      final io.HttpClientRequest request = await client.getUrl(uri);

      request.headers.set(io.HttpHeaders.authorizationHeader, "Bearer $token");

      final HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        final List<int> bytes =
            await consolidateHttpClientResponseBytes(response);

        final io.File file = io.File(fileName)..writeAsBytesSync(bytes);
        if (kDebugMode) {
          print('File downloaded to: ${file.path}');
        }
      } else {
        throw Exception("Failed to download file: ${response.statusCode}");
      }
    }
  } catch (e) {
    throw Exception("Error downloading file: $e");
  }
}

bool getFileExtension(final String url) {
  ///Will provide extension for image and others
  String fileExtension = url.split(".").last.split("?").first;
  if (!RegExp(r"^[a-zA-Z0-9]+$").hasMatch(fileExtension)) {
    fileExtension = "file";
  }
  if (fileExtension == "jpg" ||
      fileExtension == "jpeg" ||
      fileExtension == "png") {
    return true;
  } else {
    return false;
  }
}
