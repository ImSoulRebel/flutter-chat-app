import 'package:chat_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final users = [
    User(online: true, email: "test1@test.com", name: "Maria", uid: "1"),
    User(online: false, email: "test2@test.com", name: "Teresa", uid: "2"),
    User(online: true, email: "test3@test.com", name: "Luisa", uid: "3"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "User Name",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.black54),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.exit_to_app),
            color: Colors.black54,
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(Icons.check_circle, color: Colors.blue),
              // child: const Icon(Icons.offline_bolt, color: Colors.red),
            )
          ],
        ),
        body: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            onRefresh: () => _loadUsers(),
            header: const WaterDropHeader(
              complete: Icon(Icons.check, color: Colors.blue),
              waterDropColor: Colors.blue,
            ),
            child: _userListView()));
  }

  ListView _userListView() {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => _UserListTile(user: users[index]),
        separatorBuilder: (_, index) => const Divider(),
        itemCount: users.length);
  }

  _loadUsers() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
}

class _UserListTile extends StatelessWidget {
  final User user;
  const _UserListTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: CircleAvatar(child: Text(user.name.substring(0, 2))),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: user.online ? Colors.green : Colors.red,
            shape: BoxShape.circle),
      ),
    );
  }
}
