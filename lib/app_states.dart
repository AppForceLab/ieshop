// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppStates {
  int counter;

  AppStates({required this.counter});
}

class InitStates extends AppStates {
  InitStates() : super(counter: -2);
}
