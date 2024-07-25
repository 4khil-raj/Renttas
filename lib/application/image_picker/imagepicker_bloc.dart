import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:renttas/infrastructure/repository/pick_image/repo.dart';

part 'imagepicker_event.dart';
part 'imagepicker_state.dart';

class ImagepickerBloc extends Bloc<ImagepickerEvent, ImagepickerState> {
  ImagepickerBloc() : super(ImagepickerInitial()) {
    on<ImagepickerEvent>((event, emit) {
      emit(ImagepickerInitial());
    });

    on<ImagePickUseCamera>((event, emit) async {
      final image = await ImageService().pickImageFromCamera();
      if (image != null) {
        emit(ImageCameraSuccess(image: image));
      } else {
        emit(PickerErrorState(messege: 'Choose a Image'));
      }
    });
    on<ImagePickUseGallery>((event, emit) async {
      final image = await ImageService().pickImageFromGallery();
      if (image != null) {
        emit(ImageCameraSuccess(image: image));
      } else {
        emit(PickerErrorState(messege: 'Choose a Image'));
      }
    });
  }
}
