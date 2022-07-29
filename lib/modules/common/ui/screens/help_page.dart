part of common_ui_module;

class HelpCenterGroup {
  HelpCenterGroup({
    required this.icon,
    required this.title,
    required this.links,
  });

  final String title;
  final IconData icon;
  final List<HelpCenterLink> links;
}

class HelpCenterLink {
  HelpCenterLink({
    required this.title,
    required this.url,
  });
  final String title;
  final String url;
}

class HelpCenterPage extends HookWidget {
  const HelpCenterPage();
  static const routeName = '/common/help';

  static void open() {
    AppNavigator.push(routeName);
  }

  static Route<dynamic> route(RouteSettings settings) {
    return DefaultTransition(
      settings,
      HelpCenterPage(),
    );
  }

  Widget buildGroup(
    BuildContext context, {
    required IconData icon,
    required String title,
  }) {
    return Container(
      width: context.mediaWidth * 0.32,
      padding: context.edgeAll,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28,
            color: context.bodyColor,
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: context.textBody(
              bold: true,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildQuestion(
    BuildContext context, {
    required String question,
    required String url,
    required bool hideBorder,
  }) {
    return CSContainer(
      padding: context.edgeAll.copyWith(top: 20, bottom: 20),
      margin: EdgeInsets.zero,
      radius: 0,
      onTap: () {
        WebViewPage.open(url, question);
      },
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: context.greyColor),
          top: hideBorder != true
              ? BorderSide(color: context.greyColor)
              : BorderSide.none,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 7),
            child: CSBadge(
              color: context.primaryColor,
              size: 8,
            ),
          ),
          SizedBox(width: 6),
          Expanded(
            child: Text(
              question,
              style: context.textSecondary(
                color: context.bodyColor,
                bold: true,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final links = [
      HelpCenterGroup(
        icon: CSIcons.Bookmark,
        title: tr('user:help_manual_title'),
        links: [
          HelpCenterLink(
            title: tr('user:help_manual_help_contact'),
            url: AppLinks.helpContactUrl(context.locale.languageCode),
          ),
          HelpCenterLink(
            title: tr('user:help_manual_vote'),
            url: AppLinks.voteUrl(context.locale.languageCode),
          ),
          HelpCenterLink(
            title: tr('user:help_manual_transaction'),
            url: AppLinks.transactionUrl(context.locale.languageCode),
          ),
          HelpCenterLink(
            title: tr('user:help_manual_edition'),
            url: AppLinks.editionUrl(context.locale.languageCode),
          ),
        ],
      ),
    ];

    return CSScaffold(
      headerBgColor: context.primaryColor,
      backgroundColor: context.whiteColor,
      child: Column(
        children: [
          Container(
            color: context.primaryColor,
            child: Transform.translate(
              offset: Offset(0, context.edgeSize),
              child: Container(
                color: context.primaryColor,
                padding: context.edgeAll.copyWith(top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr('user:help_title'),
                      style: context.textHuge(
                        bold: true,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    CSImage(
                      'assets/images/help_bg.png',
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: context.boxDecorationOnlyTop(),
              child: ListView(
                shrinkWrap: true,
                children: links
                    .asMap()
                    .entries
                    .map(
                      (group) => Column(
                        children: [
                          Row(
                            children: [
                              buildGroup(
                                context,
                                icon: group.value.icon,
                                title: group.value.title,
                              ),
                              Expanded(
                                child: Column(
                                  children: group.value.links
                                      .asMap()
                                      .entries
                                      .map(
                                        (question) => buildQuestion(
                                          context,
                                          question: question.value.title,
                                          url: question.value.url,
                                          hideBorder: question.key == 0,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                          if (group.key != links.length - 1)
                            Divider(
                              color: context.greyColor,
                              height: 1,
                              thickness: 1,
                            ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          DividerShadow(),
          // CSButton(
          //   margin: context.edgeVertical,
          //   label: tr('user:help_btn_more'),
          //   onPressed: () {
          //     WebViewPage.open(tr('user:help_btn_more_url'));
          //   },
          // ),
        ],
      ),
    );
  }
}
