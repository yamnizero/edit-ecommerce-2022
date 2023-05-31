class AppLinkApi {

  /// ======================= Link => server ==================  ///
  static const String server = "https://ecommerce-app-flutter.000webhostapp.com/ecommerce";

  /// ======================= imagesApp ==================  ///
  static const String imagesApp =
      "https://ecommerce-app-flutter.000webhostapp.com/ecommerce/upload";
  static const String imagesCategories = "$imagesApp/categories";
  static const String imagesItems = "$imagesApp/items";
  static const String test = "$server/test.php";

  /// ======================= Auth ==================  ///

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifyCodeSignUp = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";

  /// ======================= ForgetPassword ==================  ///

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifyCodeForgetPassword =
      "$server/forgetpassword/new_verifycode.php";

  /// ======================= Notification ==================  ///
  static const String notification = "$server/notification.php";
  /// ======================= Home ==================  ///

  /// home
  static const String homePage = "$server/home.php";

  /// items
  static const String items = "$server/items/items.php";
  static const String searchItems = "$server/items/search.php";

  ///Favorite
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deleteFromFavorite = "$server/favorite/deletefromfavorite.php";

  /// cart
  static const String cartView = "$server/cart/cartview.php";
  static const String cartAdd = "$server/cart/add.php";
  static const String cartDelete= "$server/cart/delete.php";
  static const String getCountItems= "$server/cart/getcountitems.php";

  ///address
  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";


  ///coupon
  static const String checkCoupon = "$server/coupon/check_coupon.php";

  ///CheckOut
  static const String checkOrders = "$server/orders/checkout.php";

  ///OrdersDetails
  static const String pendingOrders = "$server/orders/pending.php";
  static const String detailsOrders = "$server/orders/details.php";




}
