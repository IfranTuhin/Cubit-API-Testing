import 'package:api_handling_3/Data/Models/post_model.dart';
import 'package:api_handling_3/Data/Repositories/post_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()){
    fetchPosts();
  }

  PostRepository postRepository = PostRepository();

  void fetchPosts() async {
    try{
      List<PostModel> posts = await postRepository.fetchPost();
      emit(PostLoadedState(posts));
    }
    catch(ex){
      emit(PostErrorState(ex.toString()));
    }
  }
}
