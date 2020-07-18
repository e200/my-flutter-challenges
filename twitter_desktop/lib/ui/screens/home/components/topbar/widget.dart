import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:twitter_desktop/bloc/theme_bloc.dart';
import 'package:twitter_desktop/ui/components/user.dart';

class Topbar extends StatefulWidget {
  @override
  _TopbarState createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(.2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Align(
        child: SizedBox(
          width: 1024,
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              Expanded(
                child: Container(
                  width: 300,
                  child: BlocBuilder<ThemeBloc, bool>(
                    bloc: BlocProvider.of<ThemeBloc>(context),
                    builder: (context, isDark) {
                      return TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          prefixIcon: Icon(
                            FeatherIcons.search,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Search on Twitter',
                          labelStyle: TextStyle(
                            color: isDark
                                ? Colors.white.withOpacity(.3)
                                : Colors.black.withOpacity(.3),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    UserAvatar(
                      username: '@iam_e200',
                      userAvatar:
                          'https://pbs.twimg.com/profile_images/1276524106662449152/RWkF0y0i_reasonably_small.jpg',
                    ),
                    SizedBox(width: 35),
                    BlocBuilder<ThemeBloc, bool>(
                      builder: (BuildContext context, isDarkMode) {
                        return IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: Icon(isDarkMode
                              ? FeatherIcons.sun
                              : FeatherIcons.moon),
                          onPressed: () {
                            BlocProvider.of<ThemeBloc>(context).add(
                              isDarkMode ? LightTheme() : DarkTheme(),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
