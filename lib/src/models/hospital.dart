class HospitalResponse {
  late bool success;
  String? message;
  late List<Hospital> hospitals;

  HospitalResponse(
      {this.success = false, this.message, this.hospitals = const []});

  HospitalResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      hospitals = <Hospital>[];
      json['data'].forEach((v) {
        hospitals.add(new Hospital.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    if (hospitals != null) {
      data['data'] = hospitals.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hospital {
  late int id;
  late String hospital;
  late String address;
  late String email;
  late String contact;
  late int status;
  late String date;
  late String createdAt;
  late String updatedAt;

  Hospital(
      {this.id = 0,
      this.hospital = '',
      this.address = '',
      this.email = '',
      this.contact = '',
      this.status = 0,
      this.date = '',
      this.createdAt = '',
      this.updatedAt = ''});

  Hospital.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id'].toString()) ?? 0;
    hospital = json['hospital'] ?? "";
    address = json['address'] ?? "";
    email = json['email'] ?? "";
    contact = json['contact'] ?? "";
    status = int.parse(json['status'].toString()) ?? 0;
    date = json['date'] ?? "";
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['hospital'] = hospital;
    data['address'] = address;
    data['email'] = email;
    data['contact'] = contact;
    data['status'] = status;
    data['date'] = date;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  @override
  bool operator ==(Object other) {
    return id == (other as Hospital).id;
  }

  @override
  int get hashCode => Object.hash(id, hospital);
}
