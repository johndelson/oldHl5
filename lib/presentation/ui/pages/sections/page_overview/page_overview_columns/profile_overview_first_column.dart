import 'package:flutter/material.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/ui/components/custom_checkbox_with_title.dart';
import 'package:holedo/presentation/ui/components/expanded_collapse_widget.dart';
import 'package:holedo/presentation/ui/components/profile_reference_single_compoenet.dart';
import 'package:holedo/presentation/ui/components/view_timeline_edit_profile_submenu.dart';
import 'package:holedo/presentation/ui/pages/components/edit_add_buttons_of_sheet.dart';
import 'package:holedo/presentation/ui/pages/components/edit_blue_card_sheet.dart';
import 'package:holedo/presentation/ui/pages/components/profile_reference_component.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_expertise_dialog_widget.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_summary_dialog_widget.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/show_custom_dialog.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_second_columns.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/responsive.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileOverviewFirstColumn extends StatefulWidget {
  const ProfileOverviewFirstColumn({
    Key? key,
    required this.userProfileData,
  }) : super(key: key);

  final User userProfileData;

  @override
  State<ProfileOverviewFirstColumn> createState() =>
      _ProfileOverviewFirstColumnState();
}

class _ProfileOverviewFirstColumnState
    extends State<ProfileOverviewFirstColumn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ProfileSummaryComponent(),
          Di.SBHETS,
          AreasOfExpertiseComponents(),
          Di.SBHL,
          ProfileReferenceComponent(),
        ],
      ),
    );
  }
}

class ProfileSummaryComponent extends StatefulWidget {
  const ProfileSummaryComponent({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;
  @override
  State<ProfileSummaryComponent> createState() =>
      _ProfileSummaryComponentState();
}

class _ProfileSummaryComponentState extends State<ProfileSummaryComponent> {
  bool showSubMenu = false;

  @override
  Widget build(BuildContext context) {
    final String? profileSummary = DbData.getUserProfileData.profileSummary;
    final isMobilePhn = isMobilePhone(context);

    return Container(
      margin: const EdgeInsets.only(bottom: Di.PSD),
      decoration: Styles.boxDecoration.copyWith(
        color: Cr.whiteColor,
        boxShadow: Styles.defaultBoxShadow,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 46,
                padding: EdgeInsets.only(
                  left: widget.isMobile ? Di.PSD : Di.PSL,
                  right: 7,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Profile summary",
                      style: h2Regular,
                    ),
                    CustomComponentDropdown(
                      size: 32,
                      iconSize: 13,
                      onTappedInside: () {
                        setState(() {
                          showSubMenu = !showSubMenu;
                        });
                      },
                      onTappedOutside: () {
                        // setState(() {
                        //   showSubMenu = false;
                        // });
                      },
                    ),
                  ],
                ),
              ),
              Di.DWZH,
              IntrinsicHeight(
                child: Stack(
                  children: [
                    if (isMobilePhn)
                      ExpandedCollapseWidget(
                        description: profileSummary ?? "",
                        isMobile: widget.isMobile,
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.only(
                          left: Di.PSD,
                          right: Di.PSD,
                          top: Di.PSD,
                          bottom: Di.PSD,
                        ),
                        child: Text(
                          profileSummary ?? "",
                          maxLines: widget.isMobile ? 6 : null,
                          style: bodyLarge.copyWith(color: Cr.darkGrey1),
                        ),
                      ),
                    EditBlueCardSheet(
                      context,
                      dataIsNull: profileSummary == null,
                      greenCardText:
                          "Add a written profile summary about your professional career, skills, work experience and achievements. Promote yourself and get recognised by other people.",
                      greenCardTip:
                          "People with detailed profile summaries are 95% more likely to be viewed and connected with.",
                      onAddPressed: () {
                        showCustomDialog(
                          context,
                          ProfileSummaryDialogWidget(
                            userProfileData: DbData.getUserProfileData,
                          ),
                        );
                      },
                    ),
                    if (profileSummary != null)
                      EditAddButtonOfSheet(
                        context,
                        onEditPressed: () {
                          showCustomDialog(
                            context,
                            ProfileSummaryDialogWidget(
                              userProfileData: DbData.getUserProfileData,
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
          if (showSubMenu)
            Positioned(
              right: 8,
              top: 41,
              child: ViewTimeEditProfileSubmenu(
                donotShowTimeline: true,
                hideSubMenuCallback: () {
                  setState(() {
                    showSubMenu = false;
                  });
                },
                editText: 'profile summary',
              ),
            ),
        ],
      ),
    );
  }
}

class AreasOfExpertiseComponents extends StatefulWidget {
  const AreasOfExpertiseComponents({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);
  final bool isMobile;

  @override
  State<AreasOfExpertiseComponents> createState() =>
      _AreasOfExpertiseComponentsState();
}

class _AreasOfExpertiseComponentsState
    extends State<AreasOfExpertiseComponents> {
  bool showSubMenu = false;

  @override
  Widget build(BuildContext context) {
    final expertise = DbData.getUserProfileData.expertise;
    return DecoratedBox(
      decoration: Styles.boxDecorationWithShadow.copyWith(color: Cr.whiteColor),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileComponentTitle(
                isMobile: widget.isMobile,
                onIconPressed: () {
                  setState(() {
                    showSubMenu = !showSubMenu;
                  });
                },
                title: "Areas of expertise",
              ),

              Di.DWZH,
              IntrinsicHeight(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: Di.PSD),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Di.SBHD,
                          if (DbData.getUserProfileData.expertise != null)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                children: List<Widget>.generate(
                                  expertise!.length,
                                  (int idx) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 3),
                                      child: CustomCheckboxWithTitle(
                                        title: (expertise[idx]).title ?? "",
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          Di.SBHD,
                        ],
                      ),
                    ),
                    EditBlueCardSheet(
                      context,
                      dataIsNull: expertise == null,
                      // dataIsNull: expertise == null,
                      greenCardText:
                          "List your skill set and areas of focus for other connections and potential employers to view.",
                      onAddPressed: () {
                        showCustomDialog(
                          context,
                          const ProfileExpertiseDialogWidget(),
                        );
                      },
                    ),
                    if (expertise != null)
                      EditAddButtonOfSheet(
                        context,
                        onEditPressed: () {
                          showCustomDialog(
                            context,
                            const ProfileExpertiseDialogWidget(),
                          );
                        },
                        onAddPressed: () {
                          showCustomDialog(
                            context,
                            const ProfileExpertiseDialogWidget(),
                          );
                          // buildAreaOfExpePopUp(context);
                        },
                      ),
                  ],
                ),
              ),

              // Training
            ],
          ),
          if (showSubMenu)
            Positioned(
              right: 8,
              top: 41,
              child: ViewTimeEditProfileSubmenu(
                donotShowTimeline: true,
                hideSubMenuCallback: () {
                  setState(() {
                    showSubMenu = false;
                  });
                },
                editText: 'area of expertise',
              ),
            ),
        ],
      ),
    );
  }
}
