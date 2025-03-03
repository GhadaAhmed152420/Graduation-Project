class ResultModel {
  late String status;
  late String type;
  late String description;

  ResultModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    type = json['Type'];
    description = json['Description'];
  }
}
