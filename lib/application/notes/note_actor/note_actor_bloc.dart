import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_actor_event.dart';
part 'note_actor_state.dart';
part 'note_actor_bloc.freezed.dart';

class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  NoteActorBloc() : super(_Initial()) {
    on<NoteActorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
