import 'package:flutter/widgets.dart';

class SidebarTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final EdgeInsets padding;
  final bool isReadOnly;
  final bool isActive;
  final int nestingLevel;

  const SidebarTile({
    Key key,
    this.title,
    this.icon,
    this.padding,
    this.isReadOnly = false,
    this.nestingLevel = 1,
    this.isActive = false,
  }) : super(key: key);

  @override
  _SidebarTileState createState() => _SidebarTileState();
}

class _SidebarTileState extends State<SidebarTile>
    with SingleTickerProviderStateMixin {
  bool _isHover = false;

  AnimationController _animationController;
  Animation _animation;

  final _inactiveColor = Color(0xFF4E586B);
  final _activeColor = Color(0xFFC4C1C2);

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _animation = ColorTween(
      begin: _inactiveColor,
      end: _activeColor,
    ).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        if (!widget.isReadOnly && !_isHover) {
          setState(() {
            _animationController.forward();
            _isHover = true;
          });
        }
      },
      onExit: (event) {
        if (!widget.isActive && _isHover) {
          setState(() {
            _animationController.reverse();
            _isHover = false;
          });
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        child: Padding(
          padding: widget.padding ??
              EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
          child: Row(
            children: <Widget>[
              if (widget.icon != null)
                Row(
                  children: <Widget>[
                    Icon(
                      widget.icon,
                      color: widget.isActive ? _activeColor : _animation.value,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              Text(
                widget.title,
                style: TextStyle(
                  color: widget.isActive ? _activeColor : _animation.value,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    if (_isHover && _animationController.status == AnimationStatus.dismissed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    super.didChangeDependencies();
  }
}
