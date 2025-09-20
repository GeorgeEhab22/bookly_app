import 'package:flutter/foundation.dart';

class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
    smallThumbnail: _convertToHttps(json['smallThumbnail'] as String?),
    thumbnail: _convertToHttps(json['thumbnail'] as String?),
  );

 static String? _convertToHttps(String? url) {
  if (url == null || url.isEmpty) return null;
  
  String httpsUrl = url.replaceAll('http://', 'https://');
  
  // Use CORS proxy for web
  if (kIsWeb) {
    return 'https://images.weserv.nl/?url=${Uri.encodeComponent(httpsUrl)}';
  }
  
  return httpsUrl;
}

  Map<String, dynamic> toJson() => {
    'smallThumbnail': smallThumbnail,
    'thumbnail': thumbnail,
  };
}