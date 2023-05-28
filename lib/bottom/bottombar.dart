import 'package:dating/bottom/inbox/message.dart';
import 'package:dating/bottom/matches/matches.dart';
import 'package:dating/settings/userprofile.dart';
import 'package:dating/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_page.dart';
import '../utils/colornotifire.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: notifire.getprimerycolor,
        bottomNavigationBar: menu(),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomePage(),
            Matches(),
            Messages(),
            UserProfile(),
          ],
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: notifire.getprimerycolor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: TabBar(
        onTap: (value) {},
        unselectedLabelColor: notifire.getgreycolor,
        labelColor: const Color(0xffFF93C1),
        indicator: const CustomTabIndicator(),
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        tabs: [
          Tab(
            child: Text(
              "Home",
              style:
                  TextStyle(fontFamily: 'Gilroy Bold', fontSize: height / 65),
            ),
            icon: Image.asset(
              "image/home.png",
              height: height / 40,
            ),
          ),
          Tab(
            child: Text(
              "Matches",
              style:
                  TextStyle(fontFamily: 'Gilroy Bold', fontSize: height / 65),
            ),
            icon: Image.asset(
              "image/matches.png",
              height: height / 40,
            ),
          ),
          Tab(
            child: Text(
              "Inbox",
              style:
                  TextStyle(fontFamily: 'Gilroy Bold', fontSize: height / 65),
            ),
            icon: Image.asset(
              "image/inbox.png",
              height: height / 40,
            ),
          ),
          Tab(
            child: Text(
              "Settings",
              style:
                  TextStyle(fontFamily: 'Gilroy Bold', fontSize: height / 65),
            ),
            icon: Image.asset(
              "image/settings.png",
              height: height / 40,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabIndicator extends Decoration {
  final double radius;

  final Color color;

  final double indicatorHeight;

  const CustomTabIndicator({
    this.radius = 3,
    this.indicatorHeight = 6,
    this.color = const Color(0xffFF93C1),
  });

  @override
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(
      this,
      onChanged,
      radius,
      color,
      indicatorHeight,
    );
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;
  final double radius;
  final Color color;
  final double indicatorHeight;

  _CustomPainter(
    this.decoration,
    VoidCallback? onChanged,
    this.radius,
    this.color,
    this.indicatorHeight,
  ) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Paint paint = Paint();
    double xAxisPos = offset.dx + configuration.size!.width / 2;
    double yAxisPos =
        offset.dy + configuration.size!.height - indicatorHeight / 2;
    paint.color = color;

    RRect fullRect = RRect.fromRectAndCorners(
      Rect.fromCenter(
        center: Offset(xAxisPos, yAxisPos),
        width: configuration.size!.width / 3,
        height: indicatorHeight,
      ),
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
    );

    canvas.drawRRect(fullRect, paint);
  }
}
