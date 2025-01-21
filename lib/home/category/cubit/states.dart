import 'package:news_app/model/source_response.dart';

abstract class SourceStates {}

class SourceInitialState extends SourceStates {}

class SourceLoadingState extends SourceStates {
  String? loadingMessage;
  SourceLoadingState({required this.loadingMessage});
}

class SourceErrorState extends SourceStates {
  String? errMessage;
  SourceErrorState({required this.errMessage});
}

class SourceSuccessState extends SourceStates {
  List<Source> sourceList;
  SourceSuccessState({required this.sourceList});
}
