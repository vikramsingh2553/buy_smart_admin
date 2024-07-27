import 'package:buy_smart_admin/shared/string_const.dart';
import 'package:buy_smart_admin/shared/widget/reuse_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringConst.accountHeader,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              const ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.person),
                ),
                title: Text(
                  StringConst.userName,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
                subtitle: Text(StringConst.settingProfile),
              ),
              const Divider(height: 50),
              ReuseListTile(
                onTap: () {},
                colors: Colors.blue.shade100,
                icon: CupertinoIcons.person,
                text: StringConst.settingProfile,
              ),
              const SizedBox(height: 20),
              ReuseListTile(
                onTap: () {},
                colors: Colors.deepPurple.shade100,
                icon: Icons.notifications_none_outlined,
                text: StringConst.settingNotifications,
              ),
              const SizedBox(height: 20),
              ReuseListTile(
                onTap: () {},
                colors: Colors.indigo.shade100,
                icon: Icons.privacy_tip_outlined,
                text: StringConst.settingPrivacy,
              ),
              const SizedBox(height: 20),
              ReuseListTile(
                onTap: () {},
                colors: Colors.green.shade100,
                icon: Icons.settings_suggest_outlined,
                text: StringConst.settingGeneral,
              ),
              const SizedBox(height: 20),
              ReuseListTile(
                onTap: () {},
                colors: Colors.orange.shade100,
                icon: Icons.info_outline_rounded,
                text: StringConst.settingAbout,
              ),
              const Divider(height: 40),
              ReuseListTile(
                onTap: () {},
                colors: Colors.redAccent.shade100,
                icon: Icons.logout,
                text: StringConst.settingLogOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
