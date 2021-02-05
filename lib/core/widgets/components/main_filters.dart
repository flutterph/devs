import 'package:devs/core/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Filters for switching between DEVBOARD and JOBS page.
class MainFilters extends StatelessWidget {
  final VoidCallback onDevboardPressed;
  final VoidCallback onJobsPressed;
  final int selectedIndex;

  const MainFilters({
    Key key,
    @required this.onDevboardPressed,
    @required this.onJobsPressed,
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _FilterButton(
          title: 'DEVBOARD',
          isSelected: selectedIndex == 0,
          onPressed: onDevboardPressed,
        ),
        _FilterButton(
          title: 'JOBS',
          isSelected: selectedIndex == 1,
          onPressed: onJobsPressed,
        ),
      ],
    );
  }
}

class _FilterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isSelected;
  final String title;

  const _FilterButton({
    Key key,
    this.onPressed,
    this.isSelected = false,
    this.title,
  }) : super(key: key);

  Color get _color => isSelected ? ThemeColors.blue : Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(48),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        width: 200,
        height: 64,
        color: _color,
        child: isSelected
            ? FlatButton(
                onPressed: onPressed,
                splashColor: ThemeColors.blueDark,
                highlightColor: ThemeColors.blueDark,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white,
                      ),
                ),
              )
            : CupertinoButton(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: ThemeColors.blue,
                      ),
                ),
                onPressed: onPressed,
              ),
      ),
    );
  }
}
