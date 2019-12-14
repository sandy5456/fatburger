class CheckOutModel {
  String tableNo;
  String carNo;
  String outsideData;
  String paymentOption;

  CheckOutModel(
      {this.carNo, this.outsideData, this.tableNo, this.paymentOption});
  factory CheckOutModel.fromJson(Map<String, dynamic> json) {
    return CheckOutModel(
      tableNo: json['tableno'],
      carNo: json['carno'],
      outsideData: json['outsidedata'],
      paymentOption: json['pamentoption'],
    );
  }
  Map toMap() {
    var map = new Map<String, dynamic>();
    map['tableno']=tableNo;
    map['carno']=carNo;
    map['outsidedata']=outsideData;
    map['payment']=paymentOption;
  }
}
