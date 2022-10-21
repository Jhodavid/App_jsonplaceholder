part of 'all_data_bloc.dart';

abstract class AllDataEvent extends Equatable {
  const AllDataEvent();

  @override
  List<Object> get props => [];
}

class UpdateAllDataEvent extends AllDataEvent {
  final List<User> users;
  final List<Todo> todos;
  final List<Photo> photos;
  final List<Album> albums;
  final List<Post> posts;
  final List<Comment> comments;

  const UpdateAllDataEvent({
    required this.users,
    required this.todos,
    required this.photos,
    required this.albums,
    required this.posts,
    required this.comments,
  });
}

class SetLoadingStateEvent extends AllDataEvent {
  final String loadingState;

  const SetLoadingStateEvent({
    required this.loadingState
  });
}
