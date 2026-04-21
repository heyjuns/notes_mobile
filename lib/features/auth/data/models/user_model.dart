import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_mobile/features/auth/domain/entities/user_entity.dart';

class UserModel {
  const UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.createdAt,
  });

  final String uid;
  final String email;
  final String name;
  final DateTime createdAt;

  factory UserModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return UserModel(
      uid: doc.id,
      email: data['email'] as String,
      name: data['name'] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() => {
        'email': email,
        'name': name,
        'createdAt': Timestamp.fromDate(createdAt),
      };

  UserEntity toEntity() => UserEntity(
        uid: uid,
        email: email,
        name: name,
        createdAt: createdAt,
      );

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
        uid: entity.uid,
        email: entity.email,
        name: entity.name,
        createdAt: entity.createdAt,
      );
}
