import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_gate_way/src/features/home/design/widget/category_card.dart';

import '../../../../core/theme/app_color.dart';

class HomePageView extends StatelessWidget {
  final List<CategoryCardModel> categoryModelList;
  const HomePageView({super.key, required this.categoryModelList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Categories',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            )),
        SizedBox(
          height: 20.h,
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.only(bottom: 20),
            scrollDirection: Axis.vertical,
            itemCount: categoryModelList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return CategoryCard(
                imagePath: categoryModelList[index].imagePath,
                title: categoryModelList[index].title,
              );
            },
          ),
        ),
      ],
    );
  }
}
