// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerL extends StatelessWidget {
const DrawerL({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
     final Color pcolor = Color.fromRGBO(102, 221, 239, 1);
    return ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 130,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        bottom: 52,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 4, color: pcolor),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'lib/images/googleLogo.jpg',
                              width: 70,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        child: Text(
                          'User',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Text(FirebaseAuth.instance.currentUser!.email!
                            .toString()),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            color: Color.fromARGB(174, 0, 0, 0),
                            offset: Offset(2, 3))
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(254, 254, 255, 1),
                    ),
                    height: 450,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.person),
                          title: Text('Edit Profile'),
                          trailing: Icon(Icons.keyboard_arrow_right_outlined),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.notifications),
                          title: Text('notifications'),
                          trailing: Icon(Icons.keyboard_arrow_right_outlined),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.security),
                          title: Text('security'),
                          trailing: Icon(Icons.keyboard_arrow_right_outlined),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.language_outlined),
                          title: Text('Language'),
                          trailing: Icon(Icons.keyboard_arrow_right_outlined),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.dark_mode),
                          title: Text('Dark mode'),
                          trailing: Icon(Icons.keyboard_arrow_right_outlined),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.policy_outlined),
                          title: Text('Terms and policies'),
                          trailing: Icon(Icons.keyboard_arrow_right_outlined),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.help),
                          title: Text('Help center'),
                          trailing: Icon(Icons.keyboard_arrow_right_outlined),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.share),
                          title: Text('Invite friends'),
                          trailing: Icon(Icons.keyboard_arrow_right_outlined),
                        ),
                        ListTile(
                          onTap: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pushNamed(context, '/landing');
                            print('sign');
                          },
                          leading: Icon(Icons.logout_outlined),
                          title: Text('Logout'),
                          trailing: Icon(Icons.keyboard_arrow_right_outlined),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
  }
}
