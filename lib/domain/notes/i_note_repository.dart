import 'package:dartz/dartz.dart';
import 'package:ddd_study/domain/notes/note.dart';
import 'package:ddd_study/domain/notes/note_failure.dart';
import 'package:kt_dart/collection.dart';

abstract class INoteRepository {
  Stream<Either<NoteFailure, KtList<Note>>> watchAll();
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted();
  Stream<Either<NoteFailure, Unit>> create(Note note);
  Stream<Either<NoteFailure, Unit>> update(Note note);
  Stream<Either<NoteFailure, Unit>> delete(Note note);
}
