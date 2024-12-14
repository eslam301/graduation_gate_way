import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/api_manger.dart';
import 'package:graduation_gate_way/src/core/api/models/projects_recommendations.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/api/models/user.dart';
import '../../../../core/const/consts.dart';
import '../../../../core/route/routes_name.dart';
import '../widget/answer_container.dart';

abstract class ProjectRecommendationController extends GetxController {
  nextQuestion();

  previousQuestion();

  submit();
}

class ProjectRecommendationControllerImp
    extends ProjectRecommendationController {
  final multiKey1 = GlobalKey<FormState>();
  final multiKey2 = GlobalKey<FormState>();
  final multiKey3 = GlobalKey<FormState>();
  late InternetConnectionChecker connection;

  final apiManger = Get.find<ApiManager>();

  var loading = false.obs; // Reactive loading state

  List<String> selectedSkills = [];

  List<String> selectedKeywords = [];

  List<String> selectedCategories = [];

  String selectedDifficulty = '';

  final currentPage = 0.obs; // Reactive variable to track current page

  late final List<GlobalKey> keys;

  late final User user;
  final PageController pageController = PageController(initialPage: 0);
  late final List<QuestionModel> questions;
  Map<String, dynamic> userAnswers = {
    'skills': '',
    'difficulty': '',
    'categories': '',
    'keywords': '',
  };

  @override
  void onInit() {
    user = Get.arguments as User;
    connection = InternetConnectionChecker();
    //---------------------
    keys = [multiKey1, multiKey2, multiKey3];
    questions = [
      QuestionModel(
        index: 1,
        question: 'What is your Skill',
        type: 'search Box',
        answers: skillsList,
        selectionListAnswerMethod: (value) => selectedSkills = value,
      ),
      QuestionModel(
        index: 2,
        question: 'What is your Category?',
        type: 'search Box',
        answers: categories,
        selectionListAnswerMethod: (value) => selectedCategories = value,
      ),
      QuestionModel(
        index: 3,
        question: 'What is your keywords?',
        type: 'search Box',
        answers: keywords,
        selectionListAnswerMethod: (value) => selectedKeywords = value,
      ),
      QuestionModel(
        index: 4,
        question: 'What is your Difficulty level?',
        answers: [
          'Easy',
          'Medium',
          'Hard',
        ],
        selectionAnswerMethod: (value) => selectedDifficulty = value,
      )
    ];

    pageController.addListener(() {
      // Update currentPage when pageController changes
      currentPage.value = pageController.page?.round() ?? 0;
    });

    super.onInit();
  }

  @override
  nextQuestion() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 600), curve: Curves.easeOut);
    userAnswers = {
      'skills': selectedSkills.join(','),
      'categories': selectedCategories.join(','),
      'keywords': selectedKeywords.join(','),
      'difficulty': selectedDifficulty,
    };
  }

  @override
  previousQuestion() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 600), curve: Curves.easeOut);
  }

  @override
  submit() async {
    loading.value = true; // Show loading animation
    if (await connection.hasConnection) {
      try {
        List<ProjectsRecommendations> projectsRecommendations = await apiManger
            .sendUserAnswerProjectRecommendation(userAnswers: userAnswers);
        Routes.projectRecommendationResultPage.toPage(
          arguments: <String, dynamic>{
            'user': user,
            'projectsRecommendationsResult': projectsRecommendations
          },
        );
      } catch (e) {
        if (kDebugMode) {
          print('Error submitting form: $e');
        }
      } finally {
        loading.value = false; // Hide loading animation
      }
    } else {
      loading.value = false; // Hide loading animation
      Get.snackbar('No Internet', 'Please check your internet connection');
    }
    loading.value = false; // Hide loading animation
  }

  bool isLastPage() => currentPage.value == questions.length;
}
