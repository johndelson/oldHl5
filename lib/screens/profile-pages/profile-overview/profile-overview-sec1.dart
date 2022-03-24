import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../profile-edit/profile-edit.dart';

class ProfileOverviewSec1 extends StatefulWidget {
  const ProfileOverviewSec1({Key? key}) : super(key: key);

  @override
  State<ProfileOverviewSec1> createState() => _ProfileOverviewSec1State();
}

class _ProfileOverviewSec1State extends State<ProfileOverviewSec1> {
  String profileSummary =
      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.

Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.

Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.''';

  Widget buildAreaOfExpertiseButton(String btnName) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
      ),
      onPressed: () {},
      icon: const Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Icon(
          Icons.check_circle,
          color: Color(0xFF0D9BDC),
          size: 14,
        ),
      ),
      label: Text(
        btnName,
        style: const TextStyle(
            color: Color(0xff272E41),
            fontSize: 14,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget buildReferencesCard(
      String img, String title, String subTitle, String description) {
    return Container(
      padding: const EdgeInsets.all(6),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Image(
              width: 45,
              height: 45,
              image: NetworkImage(img),
              fit: BoxFit.cover,
            ),
            title: Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff272E41)),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                subTitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7C8990),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 30),
                children: [
                  WidgetSpan(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 2),
                        child: Card(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0)),
                          child: const Icon(
                            Icons.format_quote_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: description,
                    style: const TextStyle(
                        height: 1.2,
                        fontSize: 14,
                        color: Color(0xff7C8990),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Color(0xFF0d9bdc),
                  ),
                  label: const Text(
                    'Show more',
                    style: TextStyle(color: Color(0xFF0d9bdc), fontSize: 14),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Future<String?> buildProfileCard() {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              child: ListView(
                children: [buildProfilePictureCard()],
              ),
            ),
          );
        });
  }

  buildProfilePictureCard() {
    return Form(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: const Color(0xFF0d9bdc),
                    child: const Center(
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Profile picture',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    Text(
                        'Your profile picture will be used on your profile and throughout the site.',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xffbdb5c2)))
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2019/10/20/20/02/nature-4564618_960_720.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.delete),
                          label: Text('Delete photo'),
                        )
                      ]),
                ),
                Column(children: []),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Summary
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(right: 20, left: 20, top: 13),
                          child: AutoSizeText(
                            'Profile summary',
                            minFontSize: 14,
                            style: TextStyle(
                                color: Color(0xFF171f39),
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Divider(
                          height: 0.5,
                          color: Color(0xffE5E5E5),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, top: 13),
                          child: AutoSizeText(
                            profileSummary,
                            minFontSize: 8,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color(
                                  0xFF7C8990,
                                ),
                                fontWeight: FontWeight.w400,
                                height: 1.5),
                          ),
                        ),
                        const SizedBox(
                          height: 13,
                        )
                      ],
                    ),
                  ),
                ),
                ProfileEdit.isEditable
                    ? ProfileEdit.buildProfileEdit(
                        width: _width,
                        height: 551,
                        popUp: () {
                          buildProfileCard();
                        })
                    : Container(),
              ],
            ),

            const SizedBox(
              height: 8,
            ),
            // Areas of expertise
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: _width,
                        color: Colors.white,
                        child: const Padding(
                          padding: EdgeInsets.only(
                              right: 20, left: 20, bottom: 13, top: 13),
                          child: AutoSizeText(
                            'Areas of expertise',
                            style: TextStyle(
                                color: Color(0xFF171f39),
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Wrap(
                        spacing: 5,
                        runSpacing: 3,
                        children: [
                          buildAreaOfExpertiseButton('Business management'),
                          buildAreaOfExpertiseButton('Training'),
                          buildAreaOfExpertiseButton('Leadership'),
                          buildAreaOfExpertiseButton('Growth hacking'),
                          buildAreaOfExpertiseButton('Finance'),
                          buildAreaOfExpertiseButton('Acquisitions'),
                          buildAreaOfExpertiseButton('Recruitment'),
                          buildAreaOfExpertiseButton(' Hotel groups'),
                          buildAreaOfExpertiseButton('Consulting'),
                          buildAreaOfExpertiseButton('Public speaking'),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFe5f4fb),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1),
                              ),
                            ),
                            onPressed: () {},
                            icon: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: Icon(
                                Icons.add,
                                color: Color(0xFF0D9BDC),
                                size: 16,
                              ),
                            ),
                            label: const Padding(
                              padding: EdgeInsets.all(1.0),
                              child: Text(
                                'Show all',
                                style: TextStyle(
                                    color: Color(0xFF0D9BDC),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ProfileEdit.isEditable
                    ? ProfileEdit.buildProfileEdit(
                        width: _width,
                        height: 260,
                        popUp: () {
                          buildProfileCard();
                        })
                    : Container(),
              ],
            ),

            const SizedBox(height: 10),

            //References card
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              right: 20, left: 20, bottom: 5, top: 13),
                          child: Text(
                            'References',
                            style: TextStyle(
                                color: Color(0xFF171f39),
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Divider(color: Colors.grey, height: 1),
                        buildReferencesCard(
                          'https://images.pexels.com/photos/712521/pexels-photo-712521.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                          'Sarah Lee MHL',
                          'General Manager, One & Only Hotel',
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        ),

                        const Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                        buildReferencesCard(
                          'https://images.pexels.com/photos/712521/pexels-photo-712521.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                          'Sarah Lee MHL',
                          'General Manager, One & Only Hotel',
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        ),
                        //work experience card
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                ProfileEdit.isEditable
                    ? ProfileEdit.buildProfileEdit(
                        width: _width,
                        height: 490,
                        popUp: () {
                          buildProfileCard();
                        })
                    : Container()
              ],
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
