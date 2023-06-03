class TestModel {
  String? usersId;
  String? usersName;
  String? usersPassword;
  String? usersEmail;
  String? usersPhone;
  String? usersVerfiycode;
  String? usersApprove;
  String? usersCreate;

  TestModel(
      {this.usersId,
      this.usersName,
      this.usersPassword,
      this.usersEmail,
      this.usersPhone,
      this.usersVerfiycode,
      this.usersApprove,
      this.usersCreate});

  TestModel.fromJson(Map<String, dynamic> json) {
    usersId = json['id'];
    usersName = json['name'];
    usersPassword = json['password'];
    usersEmail = json['email'];
    usersPhone = json['phone'];
    usersVerfiycode = json['verfiycode'];
    usersApprove = json['Check'];
    usersCreate = json['create'];
  }
}