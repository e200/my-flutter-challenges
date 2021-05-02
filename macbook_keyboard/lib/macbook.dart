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
