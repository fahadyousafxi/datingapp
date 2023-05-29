class MaintenanceModel {
  List<UserDetails>? userDetails;

  MaintenanceModel({this.userDetails});

  MaintenanceModel.fromJson(Map<String, dynamic> json) {
    if (json['userDetails'] != null) {
      userDetails = <UserDetails>[];
      json['userDetails'].forEach((v) {
        userDetails!.add(new UserDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userDetails != null) {
      data['userDetails'] = this.userDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDetails {
  int? id;
  String? maintainceMode;
  Null? createdAt;
  Null? updatedAt;

  UserDetails({this.id, this.maintainceMode, this.createdAt, this.updatedAt});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maintainceMode = json['maintaince_mode'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maintaince_mode'] = this.maintainceMode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
