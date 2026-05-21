class SurgeonResponse {
  late bool success;
  String? message;
  late List<Surgeon> surgeons;

  SurgeonResponse({this.success = false, this.message, this.surgeons = const []});

  SurgeonResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      surgeons = <Surgeon>[];
      json['data'].forEach((v) {
        surgeons.add(new Surgeon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.surgeons != null) {
      data['data'] = this.surgeons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Surgeon {
  late int id;
  late String name;
  late String createdAt;
  late String updatedAt;

  Surgeon({this.id = 0, this.name = '', this.createdAt = '', this.updatedAt = ''});

  Surgeon.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id'].toString()) ?? 0;
    name = json['name'];
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  @override
  bool operator ==(Object other) {
    return id == (other as Surgeon).id;
  }

  @override
  int get hashCode => Object.hash(id, name);
}
