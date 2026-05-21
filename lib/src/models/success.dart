class PostResponse {
  late bool status;
  String? message;

  PostResponse({this.status = false, this.message});

  PostResponse.fromJson(Map<String, dynamic> json) {
    status = json['status']=="success" || json['success'] == true;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
