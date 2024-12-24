import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/features/home/design/widget/category_card.dart';

class CategoryPageView extends StatelessWidget {
  final List<CategoryCardModel> categoryModelList;

  const CategoryPageView({super.key, required this.categoryModelList});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final HomeLayoutControllerImp controller = Get.find<HomeLayoutControllerImp>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(
          height: 20,
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
                onTap: categoryModelList[index].onTap,
              );
            },
          ),
        ),
      ],
    );
  }
}
