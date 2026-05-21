class PositionResponse {
  late bool success;
  String? message;
  late List<Position> positions;

  PositionResponse({this.success = false, this.message, this.positions = const []});

  PositionResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      positions = <Position>[];
      json['data'].forEach((v) {
        positions.add(new Position.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.positions != null) {
      data['data'] = this.positions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Position {
  late int id;
  late String position;

  Position({this.id = 0, this.position = ''});

  Position.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id'].toString()) ?? 0;
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['position'] = this.position;
    return data;
  }
}
