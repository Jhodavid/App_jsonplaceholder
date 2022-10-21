import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:jonathans_technical_test/data/services/json_query.dart';
import 'package:jonathans_technical_test/device/json_manage_file.dart';
import 'package:jonathans_technical_test/domain/entities/album.dart';
import 'package:jonathans_technical_test/domain/entities/comment.dart';
import 'package:jonathans_technical_test/domain/entities/photo.dart';
import 'package:jonathans_technical_test/domain/entities/post.dart';
import 'package:jonathans_technical_test/domain/entities/todo.dart';
import 'package:jonathans_technical_test/domain/entities/user.dart';

part 'all_data_event.dart';
part 'all_data_state.dart';

class AllDataBloc extends Bloc<AllDataEvent, AllDataState> {

  AllDataBloc() : super( const AllDataState() ) {
    on<UpdateAllDataEvent>( ((event, emit) {
      emit( state.copyWith(
        users: event.users,
        todos: event.todos,
        photos: event.photos,
        albums: event.albums,
        posts: event.posts,
        comments: event.comments,
      ));
    }));

    on<SetLoadingStateEvent>( (event, emit) => emit( state.copyWith( loadingState: event.loadingState ) ));
  }

  Future<bool> checkData() async {
    bool canGetData = false;

    JsonQuery jsonQuery = JsonQuery();
    JsonManageFile jsonManageFile = JsonManageFile();
    
    try {

      //WRITE JSON FILES
      add( const SetLoadingStateEvent(loadingState: 'Consultando y guardando usuarios...')  );
      Response? responseUsers = await jsonQuery.getJsonData(endpoint: 'users');
      final List<User> listUsers;
      if( responseUsers != null ) {
        listUsers = List<User>.from(responseUsers.data.map( ( item ) => User.fromJson( item ) ) );
        jsonManageFile.writeJsonFile(fileName: 'users', list: listUsers);
      }

      add( const SetLoadingStateEvent(loadingState: 'Consultando y guardando tareas...')  );
      Response? responseTodos = await jsonQuery.getJsonData(endpoint: 'todos');
      final List<Todo> listTodos;
      if( responseTodos != null ) {
        listTodos = List<Todo>.from(responseTodos.data.map( ( item ) => Todo.fromJson( item ) ) );
        jsonManageFile.writeJsonFile(fileName: 'todos', list: listTodos);
      }

      add( const SetLoadingStateEvent(loadingState: 'Consultando y guardando photos...')  );
      Response? responsePhotos = await jsonQuery.getJsonData(endpoint: 'photos');
      final List<Photo> listPhotos;
      if( responsePhotos != null ) {
        listPhotos = List<Photo>.from(responsePhotos.data.map( ( item ) => Photo.fromJson( item ) ) );
        jsonManageFile.writeJsonFile(fileName: 'photos', list: listPhotos);
      }

      add( const SetLoadingStateEvent(loadingState: 'Consultando y guardando álbunes...')  );
      Response? responseAlbums = await jsonQuery.getJsonData(endpoint: 'albums');
      final List<Album> listAlbums;
      if( responseAlbums != null ) {
        listAlbums = List<Album>.from(responseAlbums.data.map( ( item ) => Album.fromJson( item ) ) );
        jsonManageFile.writeJsonFile(fileName: 'albums', list: listAlbums);
      }

      add( const SetLoadingStateEvent(loadingState: 'Consultando y guardando publicaciones...')  );
      Response? responsePosts = await jsonQuery.getJsonData(endpoint: 'posts');
      final List<Post> listPosts;
      if( responsePosts != null ) {
        listPosts = List<Post>.from(responsePosts.data.map( ( item ) => Post.fromJson( item ) ) );
        jsonManageFile.writeJsonFile(fileName: 'posts', list: listPosts);
      }

      add( const SetLoadingStateEvent(loadingState: 'Consultando y guardando comentarios...')  );
      Response? responseComments = await jsonQuery.getJsonData(endpoint: 'comments');
      final List<Comment> listComments;
      if( responseComments != null ) {
        listComments = List<Comment>.from(responseComments.data.map( ( item ) => Comment.fromJson( item ) ) );
        jsonManageFile.writeJsonFile(fileName: 'comments', list: listComments);
      }

      //READ JSON FILES
      add( const SetLoadingStateEvent(loadingState: 'Cargando datos...')  );

      final jsonUsers = await jsonManageFile.readJsonFile(fileName: 'users');
      final jsonTodos = await jsonManageFile.readJsonFile(fileName: 'todos');
      final jsonPhotos = await jsonManageFile.readJsonFile(fileName: 'photos');
      final jsonAlbums = await jsonManageFile.readJsonFile(fileName: 'albums');
      final jsonPosts = await jsonManageFile.readJsonFile(fileName: 'posts');
      final jsonComments = await jsonManageFile.readJsonFile(fileName: 'comments');

      add( UpdateAllDataEvent(
        users: List<User>.from(jsonUsers.map( ( item ) => User.fromJson( item ) ) ), 
        todos: List<Todo>.from(jsonTodos.map( ( item ) => Todo.fromJson( item ) ) ), 
        photos: List<Photo>.from(jsonPhotos.map( ( item ) => Photo.fromJson( item ) ) ), 
        albums: List<Album>.from(jsonAlbums.map( ( item ) => Album.fromJson( item ) ) ), 
        posts: List<Post>.from(jsonPosts.map( ( item ) => Post.fromJson( item ) ) ), 
        comments: List<Comment>.from(jsonComments.map( ( item ) => Comment.fromJson( item ) ) )
        ) 
      );

      canGetData = true;

    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      add( const SetLoadingStateEvent(loadingState: 'Error al cargar los datos... \nVerifica tu conexión y vuelve a abrir la app')  );
    }

    return canGetData;
  }
}
