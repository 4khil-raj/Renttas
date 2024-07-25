part of 'imagepicker_bloc.dart';

@immutable
sealed class ImagepickerEvent {}

final class ImagePickUseGallery extends ImagepickerEvent {}

final class ImagePickUseCamera extends ImagepickerEvent {}
