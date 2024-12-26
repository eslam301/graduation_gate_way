import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/features/auth/design/widgets/terms_widget.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import '../../../../core/api/models/track_model.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/components/custom_text_form_field.dart';
import '../../../../core/widgets/components/main_button.dart';
import '../../../../core/widgets/multi_answer_search.dart';
import '../controller/sign_up_controller.dart';

class SignUpBodyAsStudent extends StatelessWidget {
  const SignUpBodyAsStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpControllerImp controller = Get.find<SignUpControllerImp>();
    final theme = Theme.of(context);
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.only(bottom: 100),
        cacheExtent: 1000,
        children: [
          CustomTextFormField.name(
            labelText: 'first Name',
            controller: controller.firstNameController,
          ),
          CustomTextFormField.name(
            labelText: 'last Name',
            controller: controller.lastNameController,
          ),
          CustomTextFormField.user(
            controller: controller.userNameController,
          ),
          CustomTextFormField.number(
            labelText: 'Student Id',
            suffixIcon: Icons.numbers,
            controller: controller.studentIdController,
          ),
          CustomTextFormField.number(
            labelText: 'Student count units',
            suffixIcon: Icons.watch_later_outlined,
            controller: controller.countStudentUnitsController,
          ),
          CustomTextFormField.email(
            labelText: 'Email Address',
            controller: controller.emailController,
          ),
          CustomTextFormField.password(
            controller: controller.passwordController,
          ),
          CustomTextFormField.confirmPassword(
            controller: controller.confirmPasswordController,
          ),
          MultiDropDownWidget(
            isSingleSelect: true,
            isFuturesEnabled: true,
            searchEnabled: true,
            selectionListAnswerMethodObject: (value) {
              int? id = int.parse(value[0].toString());
              controller.setSelectedTrackId(id);
            },
            fetchAnswersFuture: () async {
              List<TrackModel> tracks = await controller.getTracks();
              log('tracks ${tracks.toString()}');
              return tracks
                  .map((e) => DropdownItem(
                        label: e.name ?? '',
                        value: e.id ?? 0,
                      ))
                  .toList();
            },
          ),
          const TermsAndPrivacyCheckbox(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 275,
            child: MainButton(
                text: 'Create account',
                onPressed: () {
                  controller.createStudentAccount();
                }),
          ),
          Column(
            children: [
              Text('Already have an account?',
                  style: theme.textTheme.bodyMedium),
              InkWell(
                onTap: () {
                  controller.navigateToLogin();
                },
                child: Text('Login',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.mainColor,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
