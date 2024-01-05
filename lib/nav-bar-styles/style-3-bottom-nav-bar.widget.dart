part of persistent_bottom_nav_bar_v2;

class BottomNavStyle3 extends StatelessWidget {
  final NavBarEssentials? navBarEssentials;

  BottomNavStyle3({
    Key? key,
    this.navBarEssentials = const NavBarEssentials(items: null),
  });

  Widget _buildItem(BuildContext context, PersistentBottomNavBarItem item,
      bool isSelected, double? height, bool isMid) {
    return this.navBarEssentials!.navBarHeight == 0
        ? SizedBox.shrink()
        : Container(
      width: 150.0,
      height: height,
      color:Colors.white,
      padding: EdgeInsets.only(
          top: this.navBarEssentials!.padding?.top ??
              this.navBarEssentials!.navBarHeight! * 0.15,
          bottom: this.navBarEssentials!.padding?.bottom ??
              this.navBarEssentials!.navBarHeight! * 0.12),
      child: Container(
        alignment: Alignment.center,
        color:Colors.white,
        height: height,

        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: IconTheme(
                    data: IconThemeData(
                        size: item.iconSize,
                        color: isSelected
                            ? (item.activeColorSecondary == null
                            ? item.activeColorPrimary
                            : item.activeColorSecondary)
                            : item.inactiveColorPrimary == null
                            ? item.activeColorPrimary
                            : item.inactiveColorPrimary),
                    child:isMid?SizedBox(): isSelected
                        ? item.icon
                        : item.inactiveIcon ?? item.icon,
                  ),
                ),
                item.title == null
                    ? SizedBox.shrink()
                    : Material(
                  type: MaterialType.transparency,
                  child: FittedBox(
                      child: Text(
                        item.title!,
                        style: item.textStyle != null
                            ? (item.textStyle!.apply(
                            color: isSelected
                                ? (item.activeColorSecondary == null
                                ? item.activeColorPrimary
                                : item.activeColorSecondary)
                                : item.inactiveColorPrimary))
                            : TextStyle(
                            color: isSelected
                                ? (item.activeColorSecondary == null
                                ? item.activeColorPrimary
                                : item.activeColorSecondary)
                                : item.inactiveColorPrimary,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMiddleItem(
      PersistentBottomNavBarItem item, bool isSelected, double? height) {
    return this.navBarEssentials!.navBarHeight == 0
        ? SizedBox.shrink()
        : Padding(
      padding: EdgeInsets.only(
          top: this.navBarEssentials!.padding?.top ?? 0.0,
          bottom: this.navBarEssentials!.padding?.bottom ?? 0.0),
      child: Stack(
        children: <Widget>[
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              child:Center(
                child: Container(
                  width: 150.0,
                  height: height,
                  margin: EdgeInsets.only(top: 0.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: item.iconFixColor != null
                        ? item.iconFixColor
                        : item.activeColorPrimary,
                    border:
                    Border.all(color: Colors.transparent, width: 0.0),
                    // boxShadow: this.navBarDecoration!.boxShadow,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: height,
                    child:
                    // SvgPicture.asset(isSelecteditem? item.icon:item.inactiveIcon ?? item.icon,
                    // width:item.iconSize,
                    // height:item.iconSize,
                    // ),

                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: IconTheme(
                                data: IconThemeData(
                                    size: item.iconSize,
                                    color: item.iconFixColor != null
                                        ? item.iconFixColor
                                        : item.activeColorSecondary == null
                                        ? item.activeColorPrimary
                                        : item.activeColorSecondary),
                                child: isSelected
                                    ? item.icon
                                    : item.inactiveIcon ?? item.icon,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ) )


        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final midIndex = (this.navBarEssentials!.items!.length / 2).floor();
    return Container(
      height: 500,
      width: double.infinity,
      color: Colors.yellow.withOpacity(0.2),
    );
  }
}
