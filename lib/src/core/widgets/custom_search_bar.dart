import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  final List <String> suggestions ;
  const CustomSearchBar({super.key , this.suggestions = const [
    '1',
    '2',
  ]});

  @override
  Widget build(BuildContext context) {
    final searchController = SearchController();
    return SizedBox(
      height: 45.h,
      width: 0.75.sw,
      child: SearchAnchor(
        searchController: searchController,

        viewElevation: 0,
        viewBackgroundColor: Colors.red,
        builder: (context, controller) {
          return SearchBar(
            shape: const WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                )
            ),
            controller: searchController,
            hintText: 'Search',
            hintStyle: WidgetStateProperty.all(
              TextStyle(
                color: Colors.grey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: const Icon(
              Icons.search,
              size: 30,
              color: Colors.grey,
            ),
          );
        },
        suggestionsBuilder:
            (BuildContext context, SearchController searchController) {
          return List<ListTile>.generate(suggestions.length, (index) {
            return ListTile(
              title: Text(suggestions[index]),
              onTap: () {},
            );
          });
        },
      ),
    );
  }
}
