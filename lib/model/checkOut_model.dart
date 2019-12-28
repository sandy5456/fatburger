class CheckOutModel {
  String phone;
  String dyningNumber;
  String dyningplace;
  //String paymentOption;

  CheckOutModel(
      {this.phone, this.dyningNumber, this.dyningplace});
  factory CheckOutModel.fromJson(Map<String, dynamic> json) {
    return CheckOutModel(
      phone: json['phone'],
      dyningNumber: json['mode'],
      dyningplace: json['pm'],
      //paymentOption: json['pamentoption'],
    );
  }
  Map toMap() {
    var map = new Map<String, dynamic>();
    map['phone']=phone;
    map['mode']=dyningNumber;
    map['pm']=dyningplace;
    //map['payment']=paymentOption;
  }
}
