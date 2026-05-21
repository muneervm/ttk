class OrderResponse {
  late bool success;
  late String message;
  late List<Order> orders;

  OrderResponse({this.success = false, this.message = '', this.orders = const []});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['patient'] != null) {
      orders = <Order>[];
      json['patient'].forEach((v) {
        orders.add(new Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.orders != null) {
      data['patient'] = this.orders.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  late String name;
  late String hospital;
  late String surgeon;
  late String valveType;
  late String type;

  Order({this.name = '', this.hospital = '', this.surgeon = '', this.valveType = '',this.type = ''});

  Order.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    hospital = json['hospital'];
    surgeon = json['surgeon'];
    valveType = json['valve_type'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['hospital'] = this.hospital;
    data['surgeon'] = this.surgeon;
    data['valve_type'] = this.valveType;
    data['type'] = this.type;
    return data;
  }
}
