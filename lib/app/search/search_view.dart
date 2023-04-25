import 'package:flutter/material.dart';
import 'package:trailerhive/core/theme/app_colors.dart';

class SearchView extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final bool didNavigate;
  const SearchView({super.key, this.onChanged, this.didNavigate = false});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.fromLTRB(12, 24, 12, 24),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.search, color: AppColors.darkGray),
          SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              enabled: widget.didNavigate,
              autofocus: false,
              textAlign: TextAlign.left,
              textInputAction: TextInputAction.done,
              maxLines: 1,
              maxLength: 60,
              cursorColor: AppColors.pink,
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                alignLabelWithHint: true,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.darkGray),
                hintText: "Search",
                contentPadding: EdgeInsets.only(bottom: 8),
              ),
              style: Theme.of(context).textTheme.bodyLarge,
              onChanged: (value) => widget.onChanged?.call(value),
            ),
          ),
        ],
      ),
    );
  }
}
