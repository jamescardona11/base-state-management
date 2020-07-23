import 'package:flutter/material.dart';
import 'package:login_app/domain/user.dart';
import 'package:login_app/services/http_services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    HttpServices().listUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (users == null || users.length == 0)
          ? const Center(child: CircularProgressIndicator())
          : _ListOfUsers(users: users),
    );
  }
}

class _ListOfUsers extends StatelessWidget {
  final List<User> users;
  const _ListOfUsers({
    Key key,
    @required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) => _BodyUserList(
        users: users,
        rowElements: [
          _AvatarUser(user: users[index]),
          _InfoUser(user: users[index]),
        ],
      ),
    );
  }
}

class _BodyUserList extends StatelessWidget {
  final List<User> users;
  final List<Widget> rowElements;

  const _BodyUserList({
    Key key,
    @required this.users,
    this.rowElements,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.18,
      margin: EdgeInsets.all(size.width * 0.5),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: -4,
              blurRadius: 8,
              offset: Offset(0, 4),
            )
          ]),
      child: Row(
        children: rowElements,
      ),
    );
  }
}

class _AvatarUser extends StatelessWidget {
  const _AvatarUser({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        topLeft: Radius.circular(30),
      ),
      child: FadeInImage(
        placeholder: const AssetImage('assets/circular_loading'),
        image: NetworkImage(user.avatar),
        fit: BoxFit.cover,
      ),
    );
  }
}

class _InfoUser extends StatelessWidget {
  const _InfoUser({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        title: Text(
          '${user.firstName} ${user.lastName}',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          user.email,
          style: TextStyle(
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
