class PaymentModel{
  String cardNo;
  String expDate;
  String cvv;
  String cardName;
  PaymentModel({
    this.cardNo,
    this.expDate,
    this.cvv,
    this.cardName
  });
    factory PaymentModel.fromJson(Map<String, dynamic> json) {
      return PaymentModel(
        cardNo: json['cardNumber'],
        expDate: json['expdate'],
        cvv: json['cvv'],
        cardName: json['cardName'],


      );
    }
   Map toMap(){
     var map= new Map<String, dynamic>();
     map['cardnumber']=cardNo;
     map['expdate']=expDate;
     map['cvv']=cvv;
     map['cardName']=cardName;
   }
}