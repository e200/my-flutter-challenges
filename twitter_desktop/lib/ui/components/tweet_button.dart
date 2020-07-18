import 'package:flutter/material.dart';

class TweetButton extends StatelessWidget {
  final EdgeInsets contentPadding;
  final Function onPressed;

  const TweetButton({
    Key key,
    this.contentPadding,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      padding: contentPadding ?? EdgeInsets.all(15),
      elevation: 0,
      color: Theme.of(context).primaryColor,
      child: Text(
        'Tweet',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
    );
  }
}
