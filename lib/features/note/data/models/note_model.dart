import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_mobile/features/note/domain/entities/note_entity.dart';

class NoteModel {
  const NoteModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String userId;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory NoteModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return NoteModel(
      id: doc.id,
      userId: data['userId'] as String,
      title: data['title'] as String,
      content: data['content'] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() => {
        'userId': userId,
        'title': title,
        'content': content,
        'createdAt': Timestamp.fromDate(createdAt),
        'updatedAt': Timestamp.fromDate(updatedAt),
      };

  NoteEntity toEntity() => NoteEntity(
        id: id,
        userId: userId,
        title: title,
        content: content,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  factory NoteModel.fromEntity(NoteEntity entity) => NoteModel(
        id: entity.id,
        userId: entity.userId,
        title: entity.title,
        content: entity.content,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}
