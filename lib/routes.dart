import 'package:flutter_application_1/TestView.dart';
import 'package:flutter_application_1/core/middleware/mymiddleware.dart';
import 'package:flutter_application_1/view/screen/address/add.dart';
import 'package:flutter_application_1/view/screen/address/adddetails.dart';
import 'package:flutter_application_1/view/screen/address/view.dart';
import 'package:flutter_application_1/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:flutter_application_1/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:flutter_application_1/view/screen/auth/login.dart';
import 'package:flutter_application_1/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:flutter_application_1/view/screen/auth/signup.dart';
import 'package:flutter_application_1/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:flutter_application_1/view/screen/auth/success_signup.dart';
import 'package:flutter_application_1/view/screen/auth/verifycodesignup.dart';
import 'package:flutter_application_1/view/screen/cart.dart';
import 'package:flutter_application_1/view/screen/checkout.dart';
import 'package:flutter_application_1/view/screen/home.dart';
import 'package:flutter_application_1/view/screen/homescreen.dart';
import 'package:flutter_application_1/view/screen/items.dart';
import 'package:flutter_application_1/view/screen/language.dart';
import 'package:flutter_application_1/view/screen/myfavorite.dart';
import 'package:flutter_application_1/view/screen/onboarding.dart';
import 'package:flutter_application_1/view/screen/orders/archive.dart';
import 'package:flutter_application_1/view/screen/orders/details.dart';
import 'package:flutter_application_1/view/screen/orders/pending.dart';
import 'package:flutter_application_1/view/screen/productdetails.dart';
import 'package:get/get.dart';
import 'core/constant/routes.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  GetPage(name: "/", page: () => const Login()),
//  Auth
  // GetPage(name: "/", page: () => Test()),

  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),

  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),

  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
];
