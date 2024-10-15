// To parse this JSON data, do
//
//     final photosModal = photosModalFromJson(jsonString);

import 'dart:convert';

List<PhotosModal> photosModalFromJson(String str) => List<PhotosModal>.from(json.decode(str).map((x) => PhotosModal.fromJson(x)));

String photosModalToJson(List<PhotosModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotosModal {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  PhotosModal({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory PhotosModal.fromJson(Map<String, dynamic> json) => PhotosModal(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
//Api :https://jsonplaceholder.typicode.com/photos