import 'package:employee_profile/lang.dart';
import 'package:employee_profile/main.dart';
import 'package:employee_profile/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        title: Text(AppLocalizations.of(context)!.title,
            style: CustomTextStyle.heading(context)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
              ),
              onChanged: (Language? language) {
                if (language != null) {
                  MyApp.setLocale(context, Locale(language.languageCode, ''));
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                ),
                child: Text(AppLocalizations.of(context)!.viewProfile,
                    style: const TextStyle(fontSize: 16, color: Colors.white)))
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
    backgroundColor: const Color(0xffF8F8F8),
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
                      Text(AppLocalizations.of(context)!.profile,
                          style: CustomTextStyle.heading(context)),
                    ],
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
                            child: Text(
                              AppLocalizations.of(context)!.done,
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
                          AppLocalizations.of(context)!.personalInformation,
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
                                  title:
                                      AppLocalizations.of(context)!.firstName,
                                  subTitle: "Emma",
                                ),
                                const Divider(
                                  indent: 15.0,
                                  endIndent: 15.0,
                                ),
                                CustomTitleBuild(
                                  title: AppLocalizations.of(context)!.lastName,
                                  subTitle: "Corrine",
                                ),
                                const Divider(
                                  indent: 15.0,
                                  endIndent: 15.0,
                                ),
                                CustomTitleBuild(
                                  title:
                                      AppLocalizations.of(context)!.dateOfBirth,
                                  subTitle: "09/24/1999",
                                ),
                                const Divider(
                                  indent: 15.0,
                                  endIndent: 15.0,
                                ),
                                CustomTitleBuild(
                                  title: AppLocalizations.of(context)!.gender,
                                  subTitle:
                                      AppLocalizations.of(context)!.female,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          AppLocalizations.of(context)!.contractDetails,
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
                                title: AppLocalizations.of(context)!.dateHired,
                                subTitle: "25/05/2024",
                              ),
                              const Divider(
                                indent: 15.0,
                                endIndent: 15.0,
                              ),
                              CustomTitleBuild(
                                title: AppLocalizations.of(context)!
                                    .expirationDate,
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
                          AppLocalizations.of(context)!.personalInformation,
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
                                title: AppLocalizations.of(context)!.position,
                                subTitle: "Software Engineer",
                              ),
                              const Divider(
                                indent: 15.0,
                                endIndent: 15.0,
                              ),
                              CustomTitleBuild(
                                title: AppLocalizations.of(context)!.startDate,
                                subTitle: "25/05/2025",
                              ),
                              const Divider(
                                indent: 15.0,
                                endIndent: 15.0,
                              ),
                              CustomTitleBuild(
                                title:
                                    AppLocalizations.of(context)!.managersName,
                                subTitle: "John Doe",
                              ),
                              const Divider(
                                indent: 15.0,
                                endIndent: 15.0,
                              ),
                              CustomTitleBuild(
                                title:
                                    AppLocalizations.of(context)!.contactNumber,
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
