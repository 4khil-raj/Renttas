part of 'imagepicker_bloc.dart';

@immutable
sealed class ImagepickerState {}

final class ImagepickerInitial extends ImagepickerState {}

class ImageCameraSuccess extends ImagepickerState {
  final XFile image;
  ImageCameraSuccess({required this.image});
}

class PickerErrorState extends ImagepickerState {
  final String messege;
  PickerErrorState({required this.messege});
}
