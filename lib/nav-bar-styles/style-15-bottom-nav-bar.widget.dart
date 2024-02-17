part of persistent_bottom_nav_bar_v2;

class BottomNavStyle15 extends StatelessWidget {
  final NavBarEssentials? navBarEssentials;
  final NavBarDecoration? navBarDecoration;

  BottomNavStyle15({
    Key? key,
    this.navBarEssentials = const NavBarEssentials(items: null),
    this.navBarDecoration = const NavBarDecoration(),
  });

  Widget _buildItem(BuildContext context, PersistentBottomNavBarItem item,
      bool isSelected, double? height, bool isMid) {
    return this.navBarEssentials!.navBarHeight == 0
        ? SizedBox.shrink()
        : Container(
            width: 150.0,
            height: height,
      color: Colors.white,

      padding: EdgeInsets.only(
                top: this.navBarEssentials!.padding?.top ??
                    this.navBarEssentials!.navBarHeight! * 0.15,
                bottom: this.navBarEssentials!.padding?.bottom ??
                    this.navBarEssentials!.navBarHeight! * 0.12),
            child: Container(
              alignment: Alignment.center,
              height: height,
              color: Colors.white,
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
                     if(item.customText== null&&item.isCustomText==false)...[
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
                            )],
                        if(item.customText!= null&&item.isCustomText==true)...[
                              Material(
                            type: MaterialType.transparency,
                            child: FittedBox(
                                child: item.customText),
                          )
                          ],
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
                      boxShadow: this.navBarDecoration!.boxShadow,
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
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.transparent),
      height: this.navBarEssentials!.navBarHeight!+this.navBarEssentials!.navBarHeight!/2,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,

            child: Container(
              height: this.navBarEssentials!.navBarHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 15,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: this.navBarEssentials!.navBarHeight,
              color: Colors.white,
              
              child: ClipRRect(
                borderRadius:
                    this.navBarDecoration!.borderRadius ?? BorderRadius.zero,
                child: BackdropFilter(
                  filter: this
                          .navBarEssentials!
                          .items![this.navBarEssentials!.selectedIndex!]
                          .filter ??
                      ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                  child: Container(
                    height: this.navBarEssentials!.navBarHeight,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: this.navBarEssentials!.items!.map((item) {
                        int index = this.navBarEssentials!.items!.indexOf(item);
                        return Flexible(
                          child: GestureDetector(
                            onTap: () {
                              if (this
                                      .navBarEssentials!
                                      .items![index]
                                      .onPressed !=
                                  null) {
                                this.navBarEssentials!.items![index].onPressed!(
                                    this
                                        .navBarEssentials!
                                        .selectedScreenBuildContext);
                              } else {
                                this.navBarEssentials!.onItemSelected!(index);
                              }
                            },
                            child:
                            // index == midIndex
                            //     ? Container(width: 150, color: Colors.transparent)
                            //     :
                            _buildItem(
                                    context,
                                    item,
                                    this.navBarEssentials!.selectedIndex == index,
                                    this.navBarEssentials!.navBarHeight,index == midIndex),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          this.navBarEssentials!.navBarHeight == 0
              ? SizedBox.shrink()
              : Align(
            alignment: Alignment.bottomCenter,

                child: Center(
                    child: GestureDetector(
                        onTap: () {
                          if (this.navBarEssentials!.items![midIndex].onPressed !=
                              null) {
                            this.navBarEssentials!.items![midIndex].onPressed!(
                                this
                                    .navBarEssentials!
                                    .selectedScreenBuildContext);
                          } else {
                            this.navBarEssentials!.onItemSelected!(midIndex);
                          }
                        },
                        child: _buildMiddleItem(
                            this.navBarEssentials!.items![midIndex],
                            this.navBarEssentials!.selectedIndex == midIndex,
                            this.navBarEssentials!.navBarHeight)),
                  ),
              )
        ],
      ),
    );
  }
}
