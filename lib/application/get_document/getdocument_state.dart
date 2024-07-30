part of 'getdocument_bloc.dart';

@immutable
sealed class GetdocumentState {}

final class GetdocumentInitial extends GetdocumentState {}

final class DocFetchDone extends GetdocumentState {
  final List<GetDocumentModel> list;
  DocFetchDone({required this.list});
}

final class ErrorState extends GetdocumentState {
  final String msg;
  ErrorState({required this.msg});
}
