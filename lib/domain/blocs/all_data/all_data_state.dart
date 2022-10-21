part of 'all_data_bloc.dart';

class AllDataState extends Equatable {

  final List<User> users;
  final List<Todo> todos;
  final List<Photo> photos;
  final List<Album> albums;
  final List<Post> posts;
  final List<Comment> comments;

  final String loadingState;

  const AllDataState({
    this.users = const [],
    this.todos = const [],
    this.photos = const [],
    this.albums = const [],
    this.posts = const [],
    this.comments = const [],
    this.loadingState = 'Verificando datos...'
  });

  AllDataState copyWith({
    List<User>? users,
    List<Todo>? todos,
    List<Photo>? photos,
    List<Album>? albums,
    List<Post>? posts,
    List<Comment>? comments,
    String? loadingState
  }) => AllDataState(
    users: users ?? this.users,
    todos: todos ?? this.todos,
    photos: photos ?? this.photos,
    albums: albums ?? this.albums,
    posts: posts ?? this.posts,
    comments: comments ?? this.comments,
    loadingState: loadingState ?? this.loadingState,
  );
  
  @override
  List<Object> get props => [ users, todos, photos, albums, posts, comments, loadingState ];
}

