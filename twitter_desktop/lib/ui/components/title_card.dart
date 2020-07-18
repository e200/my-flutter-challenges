import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_desktop/bloc/theme_bloc.dart';
import 'package:twitter_desktop/ui/components/card.dart';

class TitledCard extends StatelessWidget {
  final String title;
  final double width;
  final Widget child;
  final EdgeInsets padding;

  const TitledCard({
    Key key,
    this.title,
    this.width,
    this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (context, isDark) {
        return AppCard(
          width: width,
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline6.apply(
                      color: isDark
                          ? Colors.white.withOpacity(.6)
                          : Colors.black.withOpacity(.6),
                    ),
              ),
              SizedBox(height: 15),
              child,
            ],
          ),
        );
      },
    );
  }
}
