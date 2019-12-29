



import 'dart:io';

import 'package:kyankafe/JSON_DATA/providers/Add_To_Cart_api.dart';
import 'package:kyankafe/JSON_DATA/providers/Cart_api.dart';
import 'package:kyankafe/JSON_DATA/providers/CheckOut_api.dart';
import 'package:kyankafe/JSON_DATA/providers/Fav_post_api.dart';
import 'package:kyankafe/JSON_DATA/providers/Get_fav_api.dart';
import 'package:kyankafe/JSON_DATA/providers/Getting_CART_api.dart';
import 'package:kyankafe/JSON_DATA/providers/Offer_Products_api.dart';
import 'package:kyankafe/JSON_DATA/providers/Payment_api.dart';
import 'package:kyankafe/JSON_DATA/providers/Post_cart_api.dart';
import 'package:kyankafe/JSON_DATA/providers/Registration_api.dart';
import 'package:kyankafe/JSON_DATA/providers/conForm_cart.api.dart';
import 'package:kyankafe/JSON_DATA/providers/offer_image_api.dart';
import 'package:kyankafe/JSON_DATA/providers/produts_api.dart';
import 'package:kyankafe/MODEL/Get_Cart_Model2.dart';
import 'package:kyankafe/MODEL/OfferImage.dart';
import 'package:kyankafe/MODEL/Offer_product_model.dart';
import 'package:kyankafe/MODEL/Payment_model.dart';
import 'package:kyankafe/MODEL/Post_cart_model.dart';
import 'package:kyankafe/MODEL/foods_response.dart';
import 'package:kyankafe/MODEL/get_fav_Model.dart';

class Repository {
  final propertyprovider = PropertyProvider();
  final offerImageProvider = OfferImageProvider();
  final offerProductProvider = OfferProductProvider();
  final cartApiProvider = CartApiProvider();
  final addtocart=AddTocartApi();
  final getCartApi = GettingCARTApi();
  final checkoutApi = CheckoutApi();
  final paymentApi = PaymentApi();
  final postFavApi = FavPostProvider();
  final addTocartApi = AddTocartApi();
  final conFirmCARTApi = ConFirmCARTApi();
  final getFavApi = GetFavApi();
  final postCartApi=PostCartApi();
  final registrationApi=RegistrationApi();

  Future<List<FoodResponse>> fetchAllProperty() =>
      propertyprovider.fetchPropertyList();

  Future<List<OfferImageModel>> fetchAllImages() =>
      offerImageProvider.fetchImageList();

  Future<List<OfferProductModel>> fetchAllOfferPRoducts() =>
      offerProductProvider.fetchOfferProductList();

  Future<GetCartModel2> fetchAllGetCartItems() => getCartApi.fetchCARTList();

  Future<List<GetFavModel>> fetchAllfavList() => getFavApi.fetchfavList();
  Future<GetCartModel2> fetchAllConfirmCartItem() =>
      conFirmCARTApi.fetchconfinrmCARTList();
  Future addPostCartData(PostCartModel postCartModel) =>
      postCartApi.postcartData(postCartModel);


  Future removeToCart(var productId) =>
      addtocart.removeToCart(productId);
  Future addToCart(String productId, String quantity) =>
      addtocart.addToCart(productId,  quantity);
 Future updateToCart(String productId, String quantity) =>
      addtocart.updateToCart(productId,  quantity);
  Future removeProductFromCart(String productId, String phone) =>
      cartApiProvider.removeFromCart(productId, phone);

  Future addPostData(String phone,String dyningnumber,String dyningplace) =>
      checkoutApi.postCheckoutData(phone,dyningnumber,dyningplace);

  Future addProductToFav(var productId, var phone) =>
      postFavApi.addToFav(productId, phone);

  Future removeProductFromFav(var productId, ) =>
      postFavApi.removeFromFav(productId);
  Future registraionPost(var name, var password,var phone,File image)=>
  registrationApi.postRegistrationData(name,password,phone,image);

  Future paymentData(PaymentModel paymentModel) =>
      paymentApi.postPaymentData(paymentModel);
}
