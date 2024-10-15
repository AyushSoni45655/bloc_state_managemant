import 'package:bloc/bloc.dart';

import '../repositry/repos.dart';
import 'api_event.dart';
import 'api_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final PhotosRepository photosRepository;

  PhotosBloc(this.photosRepository) : super(PhotosInitial()) {
    on<FetchPhotos>((event, emit) async {
      emit(PhotosLoading());
      try {
        final photos = await photosRepository.fetchPhotos();
        emit(PhotosLoaded(photos));
      } catch (e) {
        emit(PhotosError(e.toString()));
      }
    });
  }
}