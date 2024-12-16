import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/api/models/projects_recommendations.dart';
import 'package:graduation_gate_way/src/core/extensions/on_widgets.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/api/models/user.dart';
import '../../../../core/const/consts.dart';
import '../../../../core/route/routes_name.dart';
import '../../data/data_source/api/project_recommendation_api.dart';
import '../widget/answer_container.dart';

abstract class ProjectRecommendationController extends GetxController {
  void nextQuestion();

  void previousQuestion();

  Future<void> submit();
}

class ProjectRecommendationControllerImp
    extends ProjectRecommendationController {
  final _apiManager = Get.find<ProjectRecommendationApi>();
  final _connection = InternetConnectionChecker();

  // Reactive Variables
  final RxBool isLoading = false.obs;
  final RxInt currentPage = 0.obs;
  final RxMap<String, String> userAnswers = <String, String>{}.obs;

  // State variables
  final List<String> selectedSkills = [];
  final List<String> selectedCategories = [];
  final List<String> selectedKeywords = [];
  String selectedDifficulty = '';

  // UI Elements
  final PageController pageController = PageController(initialPage: 0);
  final List<GlobalKey<FormState>> keys = [];
  late final User user;
  late final List<QuestionModel> questions;

  @override
  void onInit() {
    user = Get.find<User>();
    _initializeQuestions();
    super.onInit();
  }

  @override
  void onReady() {
    // Listen for pageController changes after UI is ready
    pageController.addListener(() {
      currentPage.value = pageController.page?.round() ?? 0;
    });
    super.onReady();
  }

  void _initializeQuestions() {
    // Configure form keys and questions
    keys.addAll([
      GlobalKey<FormState>(),
      GlobalKey<FormState>(),
      GlobalKey<FormState>()
    ]);
    questions = [
      QuestionModel(
        index: 1,
        question: 'What is your Skill',
        type: 'search Box',
        answers: skillsList,
        selectionListAnswerMethod: (value) => selectedSkills.assignAll(value),
      ),
      QuestionModel(
        index: 2,
        question: 'What is your Category?',
        type: 'search Box',
        answers: categories,
        selectionListAnswerMethod: (value) =>
            selectedCategories.assignAll(value),
      ),
      QuestionModel(
        index: 3,
        question: 'What are your keywords?',
        type: 'search Box',
        answers: keywords,
        selectionListAnswerMethod: (value) => selectedKeywords.assignAll(value),
      ),
      QuestionModel(
        index: 4,
        question: 'What is your Difficulty level?',
        answers: ['Easy', 'Medium', 'Hard'],
        selectionAnswerMethod: (value) => selectedDifficulty = value,
      ),
    ];
  }

  @override
  void nextQuestion() {
    if (currentPage.value < questions.length) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _updateUserAnswers();
    }
  }

  @override
  void previousQuestion() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Future<void> submit() async {
    _setLoading(true);
    Get.context?.loadable(isLoading: isLoading.value);
    if (await _checkInternetConnection()) {
      try {
        _updateUserAnswers();
        final List<ProjectRecommendationModel> recommendations =
            await _apiManager.sendUserAnswerProjectRecommendation(
          userAnswers: userAnswers,
        );

        Routes.projectRecommendationResultPage.toPage(
          arguments: {
            'user': user,
            'projectsRecommendationsResult': recommendations,
          },
        );
      } catch (e) {
        _handleError(e);
      } finally {
        _setLoading(false);
      }
    } else {
      _showNoInternetSnackbar();
      _setLoading(false);
    }
  }

  bool isLastPage() => currentPage.value == questions.length;

  Future<bool> _checkInternetConnection() async {
    try {
      return await _connection.hasConnection;
    } catch (_) {
      return false;
    }
  }

  void _setLoading(bool value) {
    isLoading.value = value;
  }

  void _updateUserAnswers() {
    userAnswers['skills'] = selectedSkills.join(',');
    userAnswers['categories'] = selectedCategories.join(',');
    userAnswers['keywords'] = selectedKeywords.join(',');
    userAnswers['difficulty'] = selectedDifficulty;
  }

  void _handleError(dynamic error) {
    if (kDebugMode) {
      print('Error occurred: $error');
    }
    Get.snackbar('Error', 'Something went wrong. Please try again.');
  }

  void _showNoInternetSnackbar() {
    Get.snackbar('No Internet', 'Please check your internet connection');
  }
}
