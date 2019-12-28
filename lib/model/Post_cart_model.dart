class PostCartModel{
  String pId;
  String quantity;
  toMap(){
    return {
    "orderNumber": 0,
    "cartItem": [
        {
            "productInfo": {
                "productCode": this.pId
                
            },
            "quantity": this.quantity,

        }
    ],
    
};
  }

}