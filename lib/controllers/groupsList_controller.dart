import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workify/controllers/auth_controller.dart';
import 'package:workify/models/userGroup/userGroup_model.dart';

final GroupsListControllerProvider = StateNotifierProvider<GroupsListController>(ref)
{
  final user = ref.watch(authControllerProvider);
  return GroupsListController(ref.read, user?.uid);
};

class GroupsListController extends StateNotifier<AsyncValue<List<UserGroup>>> {
  final Reader read;
  final String groupId;

  GroupsListController(this.read, this.groupId) : super(AsyncValue.loading());
}
