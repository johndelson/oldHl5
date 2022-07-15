import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/common/dropDownButton.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/common/build_work_exp_pop_up.dart';
import 'package:holedo/common/clipper.dart';
import 'package:holedo/common/popUpHeadMenu.dart';
import 'package:holedo/common/textfield_fieldname.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/sizedbox.dart';
import 'package:holedo/responsive/responsive.dart';
import 'package:holedo/layouts/pages/profile-pages/profile-edit/profile_edit.dart';

class ProfileOverviewSec2 extends StatefulWidget {
  final sec2IsEditable;
  final profileOverviewSec2WorkExpKey;
  final profileOverviewSec2WorkExp_H;
  final profileOverviewSec2WorkExp_W;
  final profileOverviewSec2EducationKey;
  final profileOverviewSec2Education_H;
  final profileOverviewSec2Education_W;
  final profileOverviewSec2AchievementKey;
  final profileOverviewSec2Achievement_H;
  final profileOverviewSec2Achievement_W;
  final profileOverviewSec2LanguagesKey;
  final profileOverviewSec2Languages_H;
  final profileOverviewSec2Languages_W;
  final pOApiDataSec2;

  const ProfileOverviewSec2({
    Key? key,
    required this.sec2IsEditable,
    this.profileOverviewSec2WorkExpKey,
    this.profileOverviewSec2WorkExp_H,
    this.profileOverviewSec2WorkExp_W,
    this.profileOverviewSec2EducationKey,
    this.profileOverviewSec2Education_H,
    this.profileOverviewSec2Education_W,
    this.profileOverviewSec2AchievementKey,
    this.profileOverviewSec2Achievement_H,
    this.profileOverviewSec2Achievement_W,
    this.profileOverviewSec2LanguagesKey,
    this.profileOverviewSec2Languages_H,
    this.profileOverviewSec2Languages_W,
    this.pOApiDataSec2,
  }) : super(key: key);

  @override
  State<ProfileOverviewSec2> createState() => _ProfileOverviewSec2State();
}

class _ProfileOverviewSec2State extends State<ProfileOverviewSec2> {
  bool isVisible = false;
  bool showIcon = false;
  bool isHovering = false;
  bool isShowingPopUpCard = false;

  Widget buildProfileSec2Cards(
    sec2Key,
    sec2H,
    sec2W,
    _width,
    _height,
    String cardName,
    String cardTitle,
    String cardSubTitle,
    String cardDate,
    String cardBtn,
    String cardDetail,
    IconData cardIcon,
    popUpEditCards,
    popUpAddCards,
    bool isVisible,
    String description,
    bool showIcon,
  ) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            key: sec2Key as Key,
            color: ColorPicker.kWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 13),
                        child: Text(
                          cardName,
                          style: FontTextStyle.kBlueDark120W400SSP,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (showIcon)
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isShowingPopUpCard = !isShowingPopUpCard;
                                  debugPrint(isShowingPopUpCard.toString());
                                });
                              },
                              onHover: (value) {
                                setState(() {
                                  isHovering = value;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 13, right: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: isHovering
                                        ? BorderRadius.circular(3)
                                        : BorderRadius.circular(0),
                                    border: isHovering
                                        ? Border.all(
                                            color: Colors.grey,
                                          )
                                        : Border.all(
                                            width: 0,
                                            color: Colors.transparent,
                                          ),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: ColorPicker.kBlueDark1,
                                  ),
                                ),
                              ),
                            )
                          else
                            Container(),
                        ],
                      ),
                    ),
                  ],
                ),
                SS.sB(8),
                const Divider(
                  height: .5,
                  color: Color(0xFFE5E5E5),
                ),
                SS.sB(10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                            color: ColorPicker.kBlueLight1,
                            child: Icon(
                              cardIcon,
                              color: ColorPicker.kWhite,
                              size: 16.67,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cardTitle,
                            style: FontTextStyle.kBlueDark116W700SSP,
                          ),
                          SS.sB(5),
                          GestureDetector(
                            child: Text(
                              cardSubTitle,
                              style: FontTextStyle.kBlueLight114W400SSP,
                            ),
                            onTap: () {},
                          ),
                          SS.sB(5),
                          Text(
                            cardDate,
                            style: FontTextStyle.kGreyLight5146W400SSP,
                          ),
                          SS.sB(5),
                        ],
                      ),
                    ),
                    SS.sB(0, 6),
                  ],
                ),
                SS.sB(5),
                SingleChildScrollView(
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedContainer(
                            height: isVisible ? 120 : 0,
                            color: ColorPicker.kGreyLight2,
                            duration: const Duration(seconds: 1),
                            alignment: isVisible
                                ? Alignment.topCenter
                                : Alignment.bottomCenter,
                            curve: Curves.fastOutSlowIn,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  description,
                                  style: FontTextStyle.kGreyLight516W400SSP,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            color: ColorPicker.kGreyLight2,
                            child: Row(
                              children: [
                                TextButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                  icon: Icon(
                                    isVisible ? Icons.remove : Icons.add,
                                    color: ColorPicker.kBlueLight1,
                                  ),
                                  label: Text(
                                    isVisible ? 'Close' : cardBtn,
                                    style: FontTextStyle.kBlueLight114W400SSP,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        if (showIcon)
          Positioned(
            top: 50,
            right: 10,
            child: Visibility(
              visible: isShowingPopUpCard,
              child: Column(
                children: [
                  Align(
                    alignment: const Alignment(.35, 0),
                    child: ClipPath(
                      clipper: ArrowClipper(),
                      child: Container(
                        height: 15,
                        width: 12,
                        decoration: BoxDecoration(
                          color: ColorPicker.kGreyLight7.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(.25, .12),
                    child: Container(
                      color: ColorPicker.kWhite,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.menu,
                                  color: ColorPicker.kBlueLight1,
                                  size: 10,
                                ),
                                SS.sB(0, 7.5),
                                Text(
                                  'View in timeline',
                                  style: FontTextStyle.kBlueLight114W400SSP,
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 0.5,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.menu,
                                  color: ColorPicker.kBlueLight1,
                                  size: 10,
                                ),
                                SS.sB(0, 7.5),
                                Text(
                                  'View in timeline',
                                  style: FontTextStyle.kBlueLight114W400SSP,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        else
          Container(),
        if (widget.sec2IsEditable as bool)
          ProfileEdit.buildProfileEdit(
            width: sec2W as double,
            height: sec2H as double,
            popUpEdit: () {
              popUpEditCards();
            },
            showAddButton: true,
            popUpAdd: () {
              popUpAddCards();
            },
          )
        else
          Container(),
      ],
    );
  }

  /// pop up functionality Start

  /// Work experience pop up edit functionality start

  bool isVisibleExperience = false;
  bool isExperienceEditable = false;
  bool isExperienceShowCard = false;
  int indexExp = 1;

  final BuildWorkExpPopUp _buildWorkExpPopUp = BuildWorkExpPopUp();

  Future<String?> buildWorkExpPopUp() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              child: Container(
                color: ColorPicker.kGreyLight3,
                width: Responsive.isDesktop(context)
                    ? SS.sW(context) * .50
                    : Responsive.isMobile(context)
                        ? SS.sW(context) * .90
                        : SS.sW(context) * .60,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PopUpHeadMenu.popUpHead('Work experience', context),
                      SS.sB(15),
                      if (isVisibleExperience)
                        _buildWorkExpPopUp.buildExpInnerCard(
                          false,
                          true,
                          indexExp,
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: ColorPicker.kGreenNeon,
                            child: IconButton(
                              color: ColorPicker.kWhite,
                              onPressed: () {
                                setState(
                                  () {
                                    isVisibleExperience = !isVisibleExperience;
                                  },
                                );
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ),
                        ),
                      _buildWorkExpPopUp.buildExpInnerCard(
                        true,
                        isExperienceShowCard,
                        indexExp,
                      ),
                      _buildWorkExpPopUp.buildExpInnerCard(
                        true,
                        isExperienceShowCard,
                        indexExp,
                      ),
                      SS.sB(15)
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// Work experience pop up edit functionality end

  /// Education pop up edit functionality start

  bool isVisibleEducation = false;
  bool isEducationEditable = false;
  bool isEducationShowCard = false;
  int indexEdu = 1;

  Widget buildEduInnerCard(
    bool isEducationEditable,
    bool isEducationShowCard,
    int indexEdu,
  ) {
    return StatefulBuilder(
      builder: (context, setState) {
        final List<Widget> eduTextFieldGenerate = List.generate(
          indexEdu,
          (int i) => TextFieldAndFieldName.buildTextField('Course name'),
        );
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Container(
            width: Responsive.isDesktop(context)
                ? SS.sW(context) * .50
                : Responsive.isMobile(context)
                    ? SS.sW(context) * .90
                    : SS.sW(context) * .60,
            color: ColorPicker.kWhite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      color: ColorPicker.kBlueLight1,
                      child: const Icon(
                        Icons.school_rounded,
                        color: ColorPicker.kWhite,
                        size: 18,
                      ),
                    ),
                    title: const Text(''),
                    subtitle: const Text(''),
                    trailing: isEducationEditable
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isEducationShowCard = !isEducationShowCard;
                              });
                            },
                            icon: const Icon(Icons.edit),
                          )
                        : null,
                  ),
                  if (isEducationShowCard)
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Divider(
                            height: SS.sH(context) * 0.01,
                            color: ColorPicker.kGreyLight3,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFieldAndFieldName.buildFieldName(
                                  'Educational institution',
                                  '*',
                                ),
                                TextFieldAndFieldName.buildTextField(),
                                TextFieldAndFieldName.buildFieldName(
                                  'Course duration',
                                ),
                                TextFieldAndFieldName.buildFieldName(
                                  'Qualification title',
                                ),
                                TextFieldAndFieldName.buildTextField(),
                                TextFieldAndFieldName.buildFieldName(
                                  'Description',
                                ),
                                const TextField(
                                  minLines: 4,
                                  maxLines: 6,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                ),
                                SS.sB(18),
                                TextFieldAndFieldName.buildFieldName(
                                  'Course outline',
                                ),
                                Column(children: eduTextFieldGenerate),
                                TextButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      indexEdu++;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                  label: const Text('Add another'),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OutlinedButton(
                                      onPressed: () {},
                                      child: const Text('Cancel'),
                                    ),
                                    SS.sB(0, 10),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Save'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<String?> buildEducationPopUp() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Dialog(
                child: Container(
                  color: ColorPicker.kGreyLight3,
                  width: Responsive.isDesktop(context)
                      ? SS.sW(context) * .50
                      : Responsive.isMobile(context)
                          ? SS.sW(context) * .90
                          : SS.sW(context) * .60,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        PopUpHeadMenu.popUpHead('Education', context),
                        SS.sB(15),
                        if (isVisibleEducation)
                          buildEduInnerCard(false, true, indexEdu)
                        else
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: ColorPicker.kGreenNeon,
                              child: IconButton(
                                color: ColorPicker.kWhite,
                                onPressed: () {
                                  setState(() {
                                    isVisibleEducation = !isVisibleEducation;
                                  });
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ),
                          ),
                        buildEduInnerCard(true, isEducationShowCard, indexEdu),
                        buildEduInnerCard(true, isEducationShowCard, indexEdu),
                        SS.sB(15)
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// Education pop up edit functionality end

  ///Achivement pop up edit functionality start

  bool isVisibleAchivement = false;
  bool isArchiveEditable = false;
  bool isArchiveShowCard = false;
  List achiveList = ['Award', 'Project', 'Presentation'];
  List achiveYearList = ['2010', '2011', '2012', '2013', '2014', '2015'];

  Widget buildAchiveInnerCard(
    bool isArchiveEditable,
    bool isArchiveShowCard, [
    String? title,
    String? subTitle,
    String? year,
  ]) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Container(
            width: Responsive.isDesktop(context)
                ? SS.sW(context) * .50
                : Responsive.isMobile(context)
                    ? SS.sW(context) * .90
                    : SS.sW(context) * .60,
            color: ColorPicker.kWhite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      color: ColorPicker.kBlueLight1,
                      child: const FaIcon(
                        Icons.verified_user_rounded,
                        color: ColorPicker.kWhite,
                        size: 18,
                      ),
                    ),
                    title: const Text(''),
                    subtitle: const Text(''),
                    trailing: isArchiveEditable
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isArchiveShowCard = !isArchiveShowCard;
                              });
                            },
                            icon: const Icon(Icons.edit),
                          )
                        : null,
                  ),
                  if (isArchiveShowCard)
                    Column(
                      children: [
                        Divider(
                          height: SS.sH(context) * 0.01,
                          color: ColorPicker.kGreyLight3,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFieldAndFieldName.buildFieldName(
                                'Achievement type',
                                '*',
                              ),
                              DropDownButton(
                                menuList: achiveList,
                                hintText: 'Presentation',
                              ),
                              TextFieldAndFieldName.buildFieldName(
                                'Achievement title',
                              ),
                              TextFieldAndFieldName.buildTextField(),
                              TextFieldAndFieldName.buildFieldName(
                                'Issuing entity',
                              ),
                              TextFieldAndFieldName.buildTextField(),
                              TextFieldAndFieldName.buildFieldName(
                                'Award/Website link',
                              ),
                              TextFieldAndFieldName.buildTextField(),
                              TextFieldAndFieldName.buildFieldName(
                                'Date received',
                              ),
                              SizedBox(
                                width: 100,
                                child: DropDownButton(
                                  menuList: achiveYearList,
                                  hintText: 'Year',
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: const Text('Cancel'),
                                  ),
                                  SS.sB(0, 10),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('Save'),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  else
                    Container()
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<String?> buildAchivementPopUp() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              child: Container(
                color: ColorPicker.kGreyLight3,
                width: Responsive.isDesktop(context)
                    ? SS.sW(context) * .50
                    : Responsive.isMobile(context)
                        ? SS.sW(context) * .90
                        : SS.sW(context) * .60,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PopUpHeadMenu.popUpHead('Achievements', context),
                      SS.sB(15),
                      if (isVisibleAchivement)
                        buildAchiveInnerCard(false, true)
                      else
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: ColorPicker.kGreenNeon,
                            child: IconButton(
                              color: ColorPicker.kWhite,
                              onPressed: () {
                                setState(() {
                                  isVisibleAchivement = !isVisibleAchivement;
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ),
                        ),
                      buildAchiveInnerCard(true, isArchiveShowCard),
                      buildAchiveInnerCard(true, isArchiveShowCard),
                      SS.sB(15)
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  ///Achivement pop up edit functionality end

  /// Language pop up edit functionality start

  List langItem = [
    'Native or bilingual profiency1',
    'Native or bilingual profiency2',
    'Native or bilingual profiency3'
  ];

  // String? selectValue;
  int langIndex = 2;

  Future<String?> buildLanguagePopUp(int langIndex) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            final List<Widget> textField = List.generate(
              langIndex,
              (int i) => TextFieldAndFieldName.buildTextField(),
            );
            final List<Widget> menuItem = List.generate(
              langIndex,
              (int i) => DropDownButton(
                menuList: langItem,
                hintText: 'Native or bilingual profiency',
              ),
            );
            return Dialog(
              child: Container(
                color: ColorPicker.kGreyLight3,
                width: Responsive.isDesktop(context)
                    ? SS.sW(context) * .50
                    : Responsive.isMobile(context)
                        ? SS.sW(context) * .90
                        : SS.sW(context) * .60,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PopUpHeadMenu.popUpHead('Languages', context),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: Responsive.isDesktop(context)
                              ? SS.sW(context) * .50
                              : Responsive.isMobile(context)
                                  ? SS.sW(context) * .90
                                  : SS.sW(context) * .60,
                          color: ColorPicker.kWhite,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextFieldAndFieldName.buildFieldName(
                                        'Language',
                                        '*',
                                      ),
                                      SS.sB(10, 0),
                                      Column(
                                        children: textField,
                                      ),
                                      TextButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            langIndex++;
                                          });
                                        },
                                        icon: const Icon(Icons.add),
                                        label: const Text('Add another'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextFieldAndFieldName.buildFieldName(
                                        'Proficiency',
                                        '*',
                                      ),
                                      SS.sB(10, 0),
                                      Column(
                                        children: menuItem,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Cancel',
                                            ),
                                          ),
                                          SS.sB(0, 10),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Save',
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// Language pop up edit functionality end

  List description = [
    '''Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''',
    '''Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''',
    '''Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  String cardName,
        //   String cardTitle,
        //   String cardSubTitle,
        //   String cardDate,
        //   String cardBtn,
        //   String cardDetail,
        //   IconData cardIcon,
        //   popUpEditCards,
        //   popUpAddCards,
        //   bool isVisible,
        //   String description,
        //   bool showIcon,

        buildProfileSec2Cards(
          widget.profileOverviewSec2WorkExpKey,
          widget.profileOverviewSec2WorkExp_H,
          widget.profileOverviewSec2WorkExp_W,
          SS.sW(context),
          SS.sH(context),
          'Work experience',
          'Food and Beverage Manager',
          'Marriott Hotels',
          'February 2013 – 2014 (1 year 6 months)',
          'Show more',
          'Card-Details',
          Icons.apartment_rounded,
          buildWorkExpPopUp,
          buildWorkExpPopUp,
          isVisible,
          description[0].toString(),
          true,
        ),
        buildProfileSec2Cards(
          widget.profileOverviewSec2EducationKey,
          widget.profileOverviewSec2Education_H,
          widget.profileOverviewSec2Education_W,
          SS.sW(context),
          SS.sH(context),
          'Education',
          'University of Cape Town',
          'Postgraduate Degree in Business Science',
          '2010 - 2013',
          'Course outline',
          'Card-Details',
          Icons.school_rounded,
          buildEducationPopUp,
          buildEducationPopUp,
          isVisible,
          description[1].toString(),
          false,
        ),
        buildProfileSec2Cards(
          widget.profileOverviewSec2AchievementKey,
          widget.profileOverviewSec2Achievement_H,
          widget.profileOverviewSec2Achievement_W,
          SS.sW(context),
          SS.sH(context),
          'Achievement',
          'Marriott Hotel and Resorts employee of the year awards',
          'www.mariiott.com/awards',
          '',
          ' More info',
          'Card-Details',
          Icons.verified_user_sharp,
          buildAchivementPopUp,
          buildAchivementPopUp,
          isVisible,
          description[2].toString(),
          false,
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                key: widget.profileOverviewSec2LanguagesKey as Key,
                color: ColorPicker.kWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 13),
                      child: Text(
                        'Languages',
                        style: FontTextStyle.kBlueDark120W400SSP,
                      ),
                    ),
                    SS.sB(8),
                    const Divider(
                      height: .5,
                      color: Color(0xFFE5E5E5),
                    ),
                    SS.sB(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 50,
                                color: ColorPicker.kBlueLight1,
                                child: const Icon(
                                  Icons.language,
                                  color: ColorPicker.kWhite,
                                  size: 16.67,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.pOApiDataSec2.toString(),
                                style: FontTextStyle.kBlueDark116W700SSP,
                              ),
                              SS.sB(5),
                              Text(
                                'Native and bilingual profiency',
                                style: FontTextStyle.kGreyLight514W400SSP,
                              ),
                              SS.sB(5),
                            ],
                          ),
                        ),
                        SS.sB(0, 6),
                      ],
                    ),
                    SS.sB(20),
                    const Divider(
                      height: .5,
                      color: Color(0xFFE5E5E5),
                    ),
                    SS.sB(20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 50,
                                color: ColorPicker.kBlueLight1,
                                child: const Icon(
                                  Icons.language,
                                  color: ColorPicker.kWhite,
                                  size: 16.67,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Spanish',
                                style: FontTextStyle.kBlueDark116W700SSP,
                              ),
                              SS.sB(5),
                              Text(
                                'Elementary profiency',
                                style: FontTextStyle.kGreyLight514W400SSP,
                              ),
                              SS.sB(5),
                            ],
                          ),
                        ),
                        SS.sB(0, 6)
                      ],
                    ),
                    SS.sB(20)
                  ],
                ),
              ),
            ),
            if (widget.sec2IsEditable as bool)
              ProfileEdit.buildProfileEdit(
                width: widget.profileOverviewSec2Languages_W as double,
                height: widget.profileOverviewSec2Languages_H as double,
                popUpEdit: () {
                  buildLanguagePopUp(langIndex);
                },
                showAddButton: true,
                popUpAdd: () {
                  buildLanguagePopUp(langIndex);
                },
              )
            else
              Container(),
          ],
        ),
      ],
    );
  }
}
