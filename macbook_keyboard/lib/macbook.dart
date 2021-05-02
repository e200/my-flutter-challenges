class MacbookColorScheme {
  final String name;
  final Color primary;
  final Color trackpadBorderColor;

  MacbookColorScheme({
    this.name,
    this.primary,
    this.trackpadBorderColor,
  });
}

class Macbook extends StatelessWidget {
  final MacbookColorScheme colorScheme;

  const Macbook({Key key, this.colorScheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      alignment: Alignment.topCenter,
      width: 854,
      height: 580,
      padding: EdgeInsets.only(
        left: 30,
        top: 30,
        right: 30,
      ),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            spreadRadius: 1,
            color: Colors.black.withOpacity(.2),
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          MacbookKeyboard(backgroundColor: colorScheme.primary),
          Center(child: TrackPad(color: colorScheme.trackpadBorderColor)),
        ],
      ),
    );
  }
}
class MacbookKey extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Alignment alignment;
  final Function() onPressed;

  MacbookKey({
    Key key,
    this.width,
    this.height,
    this.child,
    this.alignment,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: DefaultTextStyle(
        style: DefaultTextStyle.of(context).style.copyWith(color: Colors.white),
        child: Container(
          alignment: alignment,
          width: width,
          height: height,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF23272D),
                Color(0xFF1C1B1E),
              ],
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: child,
        ),
      ),
    );
  }
}

class TrackPad extends StatelessWidget {
  final Color color;

  const TrackPad({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 220,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
