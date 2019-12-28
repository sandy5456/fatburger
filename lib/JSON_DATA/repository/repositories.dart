import 'package:fatburger/JSON_DATA/providers/Add_To_Cart_api.dart';
import 'package:fatburger/JSON_DATA/providers/Cart_api.dart';
import 'package:fatburger/JSON_DATA/providers/CheckOut_api.dart';
import 'package:fatburger/JSON_DATA/providers/Fav_post_api.dart';
import 'package:fatburger/JSON_DATA/providers/Get_fav_api.dart';
import 'package:fatburger/JSON_DATA/providers/Getting_CART_api.dart';
import 'package:fatburger/JSON_DATA/providers/Offer_Products_api.dart';
import 'package:fatburger/JSON_DATA/providers/Payment_api.dart';
import 'package:fatburger/JSON_DATA/providers/Post_cart_api.dart';
import 'package:fatburger/JSON_DATA/providers/conForm_cart.api.dart';

import 'package:fatburger/JSON_DATA/providers/offer_image_api.dart';
import 'package:fatburger/JSON_DATA/providers/produts_api.dart';
import 'package:fatburger/MODEL/Cart_Model.dart';

import 'package:fatburger/MODEL/Get_Cart_Model2.dart';
import 'package:fatburger/MODEL/New_model_Get_cart.dart';
import 'package:fatburger/MODEL/Payment_model.dart';
import 'package:fatburger/MODEL/Post_cart_model.dart';
import 'package:fatburger/MODEL/checkOut_model.dart';
import 'package:fatburger/MODEL/get_fav_Model.dart';
import 'package:fatburger/model/OfferImage.dart';
import 'package:fatburger/model/Offer_product_model.dart';
import 'package:fatburger/model/foods_response.dart';

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


  Future removeToCart(String productId, String quantity) =>
      addtocart.removeToCart(productId,  quantity);
  Future addToCart(String productId, String quantity) =>
      addtocart.addToCart(productId,  quantity);

  Future removeProductFromCart(String productId, String phone) =>
      cartApiProvider.removeFromCart(productId, phone);

  Future addPostData(String phone,String dyningnumber,String dyningplace) =>
      checkoutApi.postCheckoutData(phone,dyningnumber,dyningplace);

  Future addProductToFav(var productId, var phone) =>
      postFavApi.addToFav(productId, phone);

  Future removeProductFromFav(var productId, ) =>
      postFavApi.removeFromFav(productId);

  Future paymentData(PaymentModel paymentModel) =>
      paymentApi.postPaymentData(paymentModel);
}
