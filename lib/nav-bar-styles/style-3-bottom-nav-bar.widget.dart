part of persistent_bottom_nav_bar_v2;

class BottomNavStyle3 extends StatelessWidget {
  final NavBarEssentials? navBarEssentials;

  BottomNavStyle3({
    Key? key,
    this.navBarEssentials = const NavBarEssentials(items: null),
  });

  Widget _buildItem(
      PersistentBottomNavBarItem item, bool isSelected, double? height) {
    return this.navBarEssentials!.navBarHeight == 0
        ? SizedBox.shrink()
        : AnimatedContainer(
            width: 100.0,
            height: height! / 1.0,
            duration:
                this.navBarEssentials!.itemAnimationProperties?.duration ??
                    Duration(milliseconds: 1000),
            curve: this.navBarEssentials!.itemAnimationProperties?.curve ??
                Curves.ease,
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration:
                  this.navBarEssentials!.itemAnimationProperties?.duration ??
                      Duration(milliseconds: 1000),
              curve: this.navBarEssentials!.itemAnimationProperties?.curve ??
                  Curves.ease,
              alignment: Alignment.center,
              height: height / 1.0,
              child: Column(
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
                      child: isSelected
                          ? item.icon
                          : item.inactiveIcon ?? item.icon,
                    ),
                  ),
                  item.title == null
                      ? SizedBox.shrink()
                      : Material(
                          type: MaterialType.transparency,
                          child: DefaultTextStyle.merge(
                            style: item.textStyle != null
                                ? item.textStyle!.apply(
                                    color: isSelected
                                        ? (item.activeColorSecondary == null
                                            ? item.activeColorPrimary
                                            : item.activeColorSecondary)
                                        : item.inactiveColorSecondary)
                                : TextStyle(
                                    color: isSelected
                                        ? (item.activeColorSecondary == null
                                            ? item.activeColorPrimary
                                            : item.activeColorSecondary)
                                        : item.inactiveColorSecondary,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0,
                                  ),
                            child: FittedBox(child: Text(item.title!)),
                          ),
                        ),
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
                top: 5.0 ?? 0.0,
                bottom: this.navBarEssentials!.padding?.bottom ?? 0.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0, -23),
                  child: Center(
                    child: Container(
                      width: 52.0,
                      height: 52.0,
                      margin: EdgeInsets.only(top: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: item.activeColorPrimary,
                        gradient: item.gradient,
                        border:
                            Border.all(color: Colors.transparent, width: 5.0),
                      ),
                      child: Container(
                        alignment: Alignment.center,
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
                  ),
                ),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final midIndex = (this.navBarEssentials!.items!.length / 2).floor();
    Color selectedItemActiveColor = this
        .navBarEssentials!
        .items![this.navBarEssentials!.selectedIndex!]
        .activeColorPrimary;
    double itemWidth = ((MediaQuery.of(context).size.width -
            ((this.navBarEssentials!.padding?.left ??
                    MediaQuery.of(context).size.width * 0.05) +
                (this.navBarEssentials!.padding?.right ??
                    MediaQuery.of(context).size.width * 0.05))) /
        this.navBarEssentials!.items!.length);
    return SizedBox(
      height: 93,
      child: Stack(
        children: [
          Positioned(
              bottom: -4,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(

                ),
                child:CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 93),
                  painter: RPSCustomPainterBlur(),
                ),
              )
          ),
          Positioned(
            bottom: -4,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(

              ),
              child:CustomPaint(
                size: Size(MediaQuery.of(context).size.width, 93),
                painter: RPSCustomPainter(),
              ),
            )
          ),


          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: this.navBarEssentials!.navBarHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                  boxShadow: [

                  ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
              ),
              padding: EdgeInsets.only(
                  top: this.navBarEssentials!.padding?.top ?? 0.0,
                  left: this.navBarEssentials!.padding?.left ??
                      MediaQuery.of(context).size.width * 0.05,
                  right: this.navBarEssentials!.padding?.right ??
                      MediaQuery.of(context).size.width * 0.05,
                  bottom: this.navBarEssentials!.padding?.bottom ??
                      this.navBarEssentials!.navBarHeight! * 0.1),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      AnimatedContainer(
                        duration: this
                                .navBarEssentials!
                                .itemAnimationProperties
                                ?.duration ??
                            Duration(milliseconds: 300),
                        curve: this
                                .navBarEssentials!
                                .itemAnimationProperties
                                ?.curve ??
                            Curves.ease,
                        color: Colors.transparent,
                        width: itemWidth *
                                        this.navBarEssentials!.selectedIndex! +(itemWidth *1/6),
                        height: 4.0,
                      ),
                      Flexible(
                        child: AnimatedContainer(
                          duration: this
                                  .navBarEssentials!
                                  .itemAnimationProperties
                                  ?.duration ??
                              Duration(milliseconds: 300),
                          curve: this
                                  .navBarEssentials!
                                  .itemAnimationProperties
                                  ?.curve ??
                              Curves.ease,
                          width: itemWidth *2/3,
                          height: 4.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                this.navBarEssentials!.selectedIndex == midIndex
                                    ? Colors.transparent
                                    : selectedItemActiveColor,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: this.navBarEssentials!.items!.map((item) {
                          int index =
                              this.navBarEssentials!.items!.indexOf(item);
                          return Flexible(
                            child: GestureDetector(
                              onTap: () {
                                if (this
                                        .navBarEssentials!
                                        .items![index]
                                        .onPressed !=
                                    null) {
                                  this
                                          .navBarEssentials!
                                          .items![index]
                                          .onPressed!(
                                      this
                                          .navBarEssentials!
                                          .selectedScreenBuildContext);
                                } else {
                                  this.navBarEssentials!.onItemSelected!(index);
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: _buildItem(
                                    item,
                                    this.navBarEssentials!.selectedIndex ==
                                        index,
                                    this.navBarEssentials!.navBarHeight),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          this.navBarEssentials!.navBarHeight == 0
              ? SizedBox.shrink()
              : Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {
                      if (this.navBarEssentials!.items![midIndex].onPressed !=
                          null) {
                        this.navBarEssentials!.items![midIndex].onPressed!(
                            this.navBarEssentials!.selectedScreenBuildContext);
                      } else {
                        this.navBarEssentials!.onItemSelected!(midIndex);
                      }
                    },
                    child: _buildMiddleItem(
                        this.navBarEssentials!.items![midIndex],
                        this.navBarEssentials!.selectedIndex == midIndex,
                        this.navBarEssentials!.navBarHeight),
                  ),
                ),
        ],
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3898533, size.height * 0.2815534);
    path_0.cubicTo(
        size.width * 0.4095947,
        size.height * 0.2815534,
        size.width * 0.4258907,
        size.height * 0.2287039,
        size.width * 0.4379493,
        size.height * 0.1717864);
    path_0.cubicTo(
        size.width * 0.4525760,
        size.height * 0.1027340,
        size.width * 0.4755280,
        size.height * 0.05825243,
        size.width * 0.5013333,
        size.height * 0.05825243);
    path_0.cubicTo(
        size.width * 0.5271387,
        size.height * 0.05825243,
        size.width * 0.5500907,
        size.height * 0.1027340,
        size.width * 0.5647173,
        size.height * 0.1717864);
    path_0.cubicTo(
        size.width * 0.5767760,
        size.height * 0.2287039,
        size.width * 0.5930720,
        size.height * 0.2815534,
        size.width * 0.6128133,
        size.height * 0.2815534);
    path_0.lineTo(size.width * 0.9573333, size.height * 0.2815534);
    path_0.cubicTo(size.width * 0.9808987, size.height * 0.2815534, size.width,
        size.height * 0.3511010, size.width, size.height * 0.4368932);
    path_0.lineTo(size.width, size.height * 0.8058252);
    path_0.cubicTo(
        size.width,
        size.height * 0.8916175,
        size.width * 0.9808987,
        size.height * 0.9611650,
        size.width * 0.9573333,
        size.height * 0.9611650);
    path_0.lineTo(size.width * 0.04266667, size.height * 0.9611650);
    path_0.cubicTo(size.width * 0.01910253, size.height * 0.9611650, 0,
        size.height * 0.8916175, 0, size.height * 0.8058252);
    path_0.lineTo(0, size.height * 0.4368932);
    path_0.cubicTo(
        0,
        size.height * 0.3511010,
        size.width * 0.01910251,
        size.height * 0.2815534,
        size.width * 0.04266667,
        size.height * 0.2815534);
    path_0.lineTo(size.width * 0.3898533, size.height * 0.2815534);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class RPSCustomPainterBlur extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3898533, size.height * 0.2815534);
    path_0.cubicTo(
        size.width * 0.4095947,
        size.height * 0.2815534,
        size.width * 0.4258907,
        size.height * 0.2287039,
        size.width * 0.4379493,
        size.height * 0.1717864);
    path_0.cubicTo(
        size.width * 0.4525760,
        size.height * 0.1027340,
        size.width * 0.4755280,
        size.height * 0.05825243,
        size.width * 0.5013333,
        size.height * 0.05825243);
    path_0.cubicTo(
        size.width * 0.5271387,
        size.height * 0.05825243,
        size.width * 0.5500907,
        size.height * 0.1027340,
        size.width * 0.5647173,
        size.height * 0.1717864);
    path_0.cubicTo(
        size.width * 0.5767760,
        size.height * 0.2287039,
        size.width * 0.5930720,
        size.height * 0.2815534,
        size.width * 0.6128133,
        size.height * 0.2815534);
    path_0.lineTo(size.width * 0.9573333, size.height * 0.2815534);
    path_0.cubicTo(size.width * 0.9808987, size.height * 0.2815534, size.width,
        size.height * 0.3511010, size.width, size.height * 0.4368932);
    path_0.lineTo(size.width, size.height * 0.8058252);
    path_0.cubicTo(
        size.width,
        size.height * 0.8916175,
        size.width * 0.9808987,
        size.height * 0.9611650,
        size.width * 0.9573333,
        size.height * 0.9611650);
    path_0.lineTo(size.width * 0.04266667, size.height * 0.9611650);
    path_0.cubicTo(size.width * 0.01910253, size.height * 0.9611650, 0,
        size.height * 0.8916175, 0, size.height * 0.8058252);
    path_0.lineTo(0, size.height * 0.4368932);
    path_0.cubicTo(
        0,
        size.height * 0.3511010,
        size.width * 0.01910251,
        size.height * 0.2815534,
        size.width * 0.04266667,
        size.height * 0.2815534);
    path_0.lineTo(size.width * 0.3898533, size.height * 0.2815534);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.black.withOpacity(0.5);
    canvas.drawPath(path_0, paint_0_fill..maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(3)));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


double convertRadiusToSigma(double radius) {
return radius * 0.57735 + 0.5;
}
