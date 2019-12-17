import 'package:fatburger/JSON_DATA/providers/Add_To_Cart_api.dart';
import 'package:fatburger/JSON_DATA/providers/Cart_api.dart';
import 'package:fatburger/JSON_DATA/providers/CheckOut_api.dart';
import 'package:fatburger/JSON_DATA/providers/Fav_post_api.dart';
import 'package:fatburger/JSON_DATA/providers/Getting_CART_api.dart';
import 'package:fatburger/JSON_DATA/providers/Offer_Products_api.dart';
import 'package:fatburger/JSON_DATA/providers/Payment_api.dart';
import 'package:fatburger/JSON_DATA/providers/offer_image_api.dart';
import 'package:fatburger/JSON_DATA/providers/produts_api.dart';
import 'package:fatburger/MODEL/Cart_Model.dart';

import 'package:fatburger/MODEL/Get_Cart_Model2.dart';
import 'package:fatburger/MODEL/Payment_model.dart';
import 'package:fatburger/MODEL/checkOut_model.dart';
import 'package:fatburger/model/OfferImage.dart';
import 'package:fatburger/model/Offer_product_model.dart';
import 'package:fatburger/model/foods_response.dart';

class Repository {
  final propertyprovider = PropertyProvider();
  final offerImageProvider = OfferImageProvider();
  final offerProductProvider = OfferProductProvider();
  final cartApiProvider = CartApiProvider();
  final getCartApi = GettingCARTApi();
  final checkoutApi=CheckoutApi();
  final paymentApi=PaymentApi();
  final postFavApi=FavPostProvider();
  final addTocartApi=AddTocartApi();

  Future<List<FoodResponse>> fetchAllProperty() =>
      propertyprovider.fetchPropertyList();

  Future<List<OfferImageModel>> fetchAllImages() =>
      offerImageProvider.fetchImageList();

  Future<List<OfferProductModel>> fetchAllOfferPRoducts() =>
      offerProductProvider.fetchOfferProductList();

  Future<List<GetCartModel2>> fetchAllGetCartItems() =>
      getCartApi.fetchCARTList();

  Future<GetCartModel2> fetchAllCartItems(String phoneNumber) =>
      cartApiProvider.fetchCartList(phoneNumber);

  Future addProductToCart(String productId, String phone, String quantity) =>
      cartApiProvider.addToCart(productId, phone, quantity);

      Future addItemsToCart(String productId, String quantity) =>
      addTocartApi.additemToCart(productId, quantity);

  Future removeProductFromCart(String productId, String phone) =>
      cartApiProvider.removeFromCart(productId, phone);
      
  Future addPostData(CheckOutModel checkOutModel) =>
      checkoutApi.postCheckoutData(checkOutModel);

  Future addProductToFav(String productId, String phone) =>
  postFavApi.addToFav(productId, phone);

   Future removeProductFromFav(String productId, String phone) =>
  postFavApi.removeFromFav(productId, phone);

        Future paymentData(PaymentModel paymentModel) =>
      paymentApi.postPaymentData(paymentModel);
}
