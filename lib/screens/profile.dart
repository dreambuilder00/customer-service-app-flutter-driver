import 'package:driver/models/user_model.dart' as user;
import 'package:driver/providers/user_provider.dart';
import 'package:driver/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({ Key? key }) : super(key: key);
  static const String route = '/profile';

  
  @override
  Widget build(BuildContext context){

    final UserProvider userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );

    final user.User? loggedUser = userProvider.loggedUser;
    
    return Scaffold(
      appBar: AppBar(
        title: const DefaultTextStyle(style: TextStyle(color:  Colors.white, fontSize: 30, fontStyle: FontStyle.normal), child: Text("Profile")),
        backgroundColor: Colors.black,
      ),
      drawer: const CustomSideDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              loggedUser!.username ?? "Johe Doe",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Email:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              loggedUser.email ?? 'johndoe@example.com',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'UserType:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              loggedUser.userType ?? '',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}