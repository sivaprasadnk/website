import 'package:riverpod/riverpod.dart';
import 'package:spnk/domain/contact_entity.dart';
import 'package:spnk/domain/experience_entity.dart';
import 'package:spnk/domain/project_entity.dart';

final contactProvider = Provider((ref) {
  return contactList;
});

final experienceProvider = Provider((ref) {
  return expList;
});

final projectProvider = Provider((ref) {
  return projectList;
});
