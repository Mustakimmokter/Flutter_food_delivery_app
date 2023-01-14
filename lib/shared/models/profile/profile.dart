// class Profile {
//   Data? data;
//
//   Profile({this.data});
//
//   Profile.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null
//         ? Data.fromJson(json['data'] as Map<String, dynamic>)
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

class Albums {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Albums({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Albums.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'] as int;
    id = json['id'] as int;
    title = json['title'] as String;
    url = json['url'] as String;
    thumbnailUrl = json['thumbnailUrl'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}
