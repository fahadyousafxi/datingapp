class GetMiningSettingModel {
  bool? status;
  String? message;
  Mining? mining;

  GetMiningSettingModel({this.status, this.message, this.mining});

  GetMiningSettingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    mining =
        json['mining'] != null ? new Mining.fromJson(json['mining']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.mining != null) {
      data['mining'] = this.mining!.toJson();
    }
    return data;
  }
}

class Mining {
  int? id;
  String? time;
  String? token;
  String? createdAt;
  String? updatedAt;

  Mining({this.id, this.time, this.token, this.createdAt, this.updatedAt});

  Mining.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
    token = json['token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['time'] = this.time;
    data['token'] = this.token;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
