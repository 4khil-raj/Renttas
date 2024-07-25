part of 'fetchexpense_bloc.dart';

@immutable
sealed class FetchexpenseEvent {}

final class GetExepenseEvent extends FetchexpenseEvent {}
