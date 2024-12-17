import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:graduation_gate_way/src/core/api/api_manger.dart';
import 'package:graduation_gate_way/src/features/chat_bot/data/data_source/api/chat_bot_api_manger.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/project_recommendation/data/data_source/api/project_recommendation_api.dart';

//
// import '../../features/auth/design/controller/forget_password_controller.dart';
// import '../../features/auth/design/controller/login_controller.dart';
// import '../../features/auth/design/controller/otp_controller.dart';
// import '../../features/auth/design/controller/reset_password_controller.dart';
// import '../../features/auth/design/controller/sign_up_controller.dart';
// import '../../features/chat_bot/design/controller/chat_controller.dart';
// import '../../features/project_recommendation/design/controller/project_page_view_details_controller.dart';
// import '../../features/project_recommendation/design/controller/project_recommendation_controller.dart';
// import '../../features/project_recommendation/design/controller/project_recommendation_result_controller.dart';
// import '../../features/splash/controller/splash_controller.dart';

Future<void> $initGetIt(GetIt sl) async {
  //! core
  //api
  sl.registerSingleton(http.Client());
  sl.registerSingleton<ApiManager>(ApiManager(client: sl()));

  // if (environment == 'prod') {
  //! Features - notifications

  // Bloc

  // UseCases
  // start gymier use cases
  // sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));

  // start Repository

  // start remote Data Sources

  // core
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));
  // sl.registerLazySingleton<BaseStorageHelper>(() => StorageHelper(sl()));
  // sl.registerLazySingleton<BaseQrCodeHelper>(() => QrCodeHelper());
  // sl.registerLazySingleton<BaseLocationHelper>(() => LocationHelper());
  // sl.registerLazySingleton<ApiServices>(() => DioService());

  // External
  // FirebaseAuth auth = FirebaseAuth.instance;
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // FirebaseStorage storage = FirebaseStorage.instance;
  // FirebaseService service = FirebaseService();
  // SharedPreferences sharedPref = await SharedPreferences.getInstance();
  // InternetConnectionChecker internetCheck = InternetConnectionChecker();
  // final client = http.Client();
  // sl.registerSingleton<FirebaseAuth>(auth);
  // sl.registerSingleton<FirebaseFirestore>(firestore);
  // sl.registerSingleton<FirebaseStorage>(storage);
  // sl.registerSingleton<FirebaseService>(service);
  // sl.registerSingleton<SharedPreferences>(sharedPref);
  // sl.registerSingleton(client);
  // sl.registerSingleton(internetCheck);
}

Future<void> initGetItGetx() async {
//   core
  Get.put(http.Client(), permanent: true);
  Get.put(InternetConnectionChecker(), permanent: true);
  Get.put(ApiManager(client: Get.find<http.Client>()), permanent: true);
  Get.put(ProjectRecommendationApi(client: Get.find<http.Client>()),
      permanent: true);
  //features
  //splash
  //Get.put(SplashControllerImp(), permanent: true);
  //auth
  //login
  //Get.put(LoginControllerImp(), permanent: true);
  //forget password
  //Get.put(ForgetPasswordControllerImp(), permanent: true);
  //sign up
  //Get.put(SignUpControllerImp(), permanent: true);
  //reset password
  //Get.put(ResetPasswordControllerImp(), permanent: true);
  //otp
  //Get.put(OTPControllerImp(), permanent: true);

  //chatbot
  Get.put(ChatBotApiManager(client: Get.find<http.Client>()), permanent: true);
  //Get.put(ChatControllerImp(), permanent: true);
  //home
  //Get.put(HomeLayoutControllerImp(), permanent: true);
  //project recommendation
  //Get.put(ProjectRecommendationControllerImp(), permanent: true);
  //Get.put(ProjectRecommendationResultControllerImp(), permanent: true);
  //Get.put(ProjectPageViewDetailsControllerImp(), permanent: true);
}
