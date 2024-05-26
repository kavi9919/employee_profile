import 'package:employee_profile/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Profile', style: CustomTextStyle.heading(context)),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.language),
            onSelected: (String value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'en',
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/us.svg',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      Text('English'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'de',
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/de.svg',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      Text('German'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'it',
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/it.svg',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      Text('Italian'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
            ),
            const SizedBox(height: 20),
            Text('Emma Corrine', style: CustomTextStyle.Nameheading(context)),
            const SizedBox(height: 5),
            Text('emma12@gmail.com',
                style: CustomTextStyle.regularBodyLight(context)),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  _showEventPreference(context);
                },
                child: Text('View Profile',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                ))
          ],
        ),
      ),
    );
  }
}

class CustomTitleBuild extends StatelessWidget {
  final String title;
  final String subTitle;

  CustomTitleBuild({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: CustomTextStyle.regularBodyLight(context),
          ),
          Text(
            subTitle,
            style: CustomTextStyle.regularBody(context),
          ),
        ],
      ),
    );
  }
}

void _showEventPreference(BuildContext context) {
  final ThemeData theme = Theme.of(context);
  showModalBottomSheet(
    backgroundColor: Color(0xffF8F8F8),
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SafeArea(
        child: DraggableScrollableSheet(
          maxChildSize: 0.94,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverAppBar(
                  expandedHeight: 40,
                  floating: true,
                  pinned: false,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  title: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/rectangle.svg',
                        width: 40,
                        height: 5,
                      ),
                      const SizedBox(height: 10),
                      Text('Profile', style: CustomTextStyle.heading(context)),
                    ],
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
                            child: Text(
                              "Done",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          "PERSONAL INFORMATION",
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CustomTitleBuild(
                                  title: "First Name",
                                  subTitle: "Emma",
                                ),
                                const Divider(
                                  indent: 15.0,
                                  endIndent: 15.0,
                                ),
                                CustomTitleBuild(
                                  title: "Last Name",
                                  subTitle: "Corrine",
                                ),
                                const Divider(
                                  indent: 15.0,
                                  endIndent: 15.0,
                                ),
                                CustomTitleBuild(
                                  title: "Date of Birth",
                                  subTitle: "09/24/1999",
                                ),
                                const Divider(
                                  indent: 15.0,
                                  endIndent: 15.0,
                                ),
                                CustomTitleBuild(
                                  title: "Gender",
                                  subTitle: "Female",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          "CONTRACT DETAILS",
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Card(
                          elevation: 0,
                          child: Column(
                            children: [
                              CustomTitleBuild(
                                title: "Date hired",
                                subTitle: "25/05/2024",
                              ),
                              const Divider(
                                indent: 15.0,
                                endIndent: 15.0,
                              ),
                              CustomTitleBuild(
                                title: "Expiration Date",
                                subTitle: "25/05/2027",
                              ),
                            ],
                          ),
                        ),
                      ),
                      //included events
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          "POSITION DETAILS",
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Card(
                          elevation: 0,
                          child: Column(
                            children: [
                              CustomTitleBuild(
                                title: "Position",
                                subTitle: "Software Engineer",
                              ),
                              const Divider(
                                indent: 15.0,
                                endIndent: 15.0,
                              ),
                              CustomTitleBuild(
                                title: "Start Date",
                                subTitle: "25/05/2025",
                              ),
                              const Divider(
                                indent: 15.0,
                                endIndent: 15.0,
                              ),
                              CustomTitleBuild(
                                title: "Manager's Name",
                                subTitle: "John Doe",
                              ),
                              const Divider(
                                indent: 15.0,
                                endIndent: 15.0,
                              ),
                              CustomTitleBuild(
                                title: "Contact Number",
                                subTitle: "+44 20 7123 4567",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
