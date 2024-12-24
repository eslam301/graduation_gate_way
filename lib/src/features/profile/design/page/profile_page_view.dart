import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/api/models/user.dart';
import '../../../../core/utils/shared_pref.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/general_app_bar.dart';
import '../widget/profile_list_tile.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({super.key});

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  User? user;
  bool isLoading = true;
  List<ProfileListTile> profileListTiles = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = await SharedPref.getUserData();
    profileListTiles = [
      ProfileListTile(
        title: 'First Name',
        iconData: Icons.person,
        subtitle: user.firstname ?? '',
      ),
      ProfileListTile(
        title: 'Last Name',
        iconData: Icons.person,
        subtitle: user.lastname ?? '',
      ),
      ProfileListTile(
        title: 'Role',
        iconData: Icons.person,
        subtitle: user.role ?? '',
      ),
      ProfileListTile(
        title: 'Username',
        iconData: Icons.person,
        subtitle: user.username ?? '',
      ),
      ProfileListTile(
        title: 'Email',
        iconData: Icons.email_rounded,
        subtitle: user.email ?? '',
      ),
      ProfileListTile(
        title: 'Phone Number',
        iconData: Icons.phone,
        subtitle: user.phoneNumber ?? '',
      ),
      ProfileListTile(
          title: 'track and project',
          iconData: Icons.location_on,
          subtitle: '${user.track}, ${user.project}'),
      ProfileListTile(
          title: 'project id and units',
          iconData: Icons.location_on,
          subtitle: '${user.projectId}, ${user.countUnits}'),
      ProfileListTile(
          title: 'student id',
          iconData: Icons.location_on,
          subtitle: '${user.studentId}'),
      ProfileListTile(
          title: 'password',
          iconData: Icons.location_on,
          subtitle: '${user.password}'),
    ];
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: generalAppBar(
        title: 'Profile',
        centerTitle: true,
        height: 80,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUserHeader(context),
                  Divider(color: Colors.grey, thickness: 1.w),
                  _buildUserData(context, profileListTiles),
                ],
              ),
            ),
    );
  }

  Widget _buildUserHeader(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/user_image.png',
          width: 60,
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user?.firstname ?? ''} ${user?.lastname ?? ''}', // Full name
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                user?.email ?? '', // Email address
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserData(
      BuildContext context, List<ProfileListTile> profileListTiles) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: profileListTiles.length,
      itemBuilder: (context, index) => profileListTiles[index],
    );
  }
}
