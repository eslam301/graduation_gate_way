class TrackModel {
  final int? id;
  final String? name;

  const TrackModel({this.id, this.name});

  factory TrackModel.fromJson(Map<String, dynamic> json) {
    return TrackModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
