import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:story_book/models/Questions.dart';
import 'package:story_book/page/score/score_screen.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = [];
  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  @override
  void onInit() {
    int? idCerita = Get.arguments?['id_cerita'];
    _pageController = PageController(); // Initialize _pageController here
    fetchDataFromApi(idCerita);
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  // Fetch data from API
  Future<void> fetchDataFromApi(int? idCerita) async {
    final String apiUrl = 'https://ceritarakyatsumbawa.com/api/question';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      // Add any additional headers as needed
    };
    final Map<String, dynamic> body = {
      'id_cerita': idCerita, // Replace with the actual ID
    };

    try {
      final response = await http.post(Uri.parse(apiUrl),
          headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        _questions = data.map((json) => Question.fromJson(json)).toList();
        print("datanya: $_questions");
        update();
      } else {
        throw Exception('Failed to load questions: ${response.statusCode}');
      }
    } catch (error, stackTrace) {
      print('Error fetching data: $error\n$stackTrace');
      throw Exception('Failed to load questions');
    }
  }

  void checkAns(Question question, int selectedIndex) {
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_selectedAns == _correctAns) _numOfCorrectAns++;
    _isAnswered = true;
    update();
    _animationController.stop();
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
    print("scorenya :${_correctAns}");
  }

  void nextQuestion() {
    if (_questionNumber.value < _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(ScoreScreen());
      print(_correctAns);
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
