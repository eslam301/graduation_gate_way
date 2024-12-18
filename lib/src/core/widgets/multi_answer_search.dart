import 'package:flutter/material.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import '../theme/app_color.dart';

class AnswersMultipleSearch extends StatelessWidget {
  // Properties
  final List<String> answers;
  final bool searchEnabled;
  final bool isSingleSelect;
  final void Function(List<String>)? selectionListAnswerMethod;
  final void Function(List<Object?>)? selectionListAnswerMethodObject;
  final Future<List<DropdownItem<Object>>> Function()? fetchAnswersFuture;

  final bool isFuturesEnabled;

  const AnswersMultipleSearch({
    super.key,
    this.answers = const [],
    this.selectionListAnswerMethod,
    this.selectionListAnswerMethodObject, // Pass a future fetcher if enabled
    this.searchEnabled = false,
    this.isSingleSelect = false,
    this.isFuturesEnabled = false, // Enable futures when needed
    this.fetchAnswersFuture,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
          isFuturesEnabled ? _buildFutureDropdown() : _buildStandardDropdown(),
    );
  }

  /// Builds the standard dropdown when `isFuturesEnabled` is false.
  Widget _buildStandardDropdown() {
    return MultiDropdown(
      onSelectionChange: (value) {
        if (selectionListAnswerMethod != null) {
          selectionListAnswerMethod!(value);
        }
      },
      searchEnabled: searchEnabled,
      singleSelect: isSingleSelect,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select at least one answer';
        }
        return null;
      },
      closeOnBackButton: true,
      fieldDecoration: _fieldDecoration(),
      dropdownDecoration: _dropdownDecoration(),
      dropdownItemDecoration: _dropdownItemDecoration(),
      searchDecoration: _searchDecoration(),
      chipDecoration: _chipDecoration(),
      items: List.generate(
        answers.length,
        (index) => DropdownItem(
          value: answers[index],
          label: answers[index],
        ),
      ),
    );
  }

  /// Builds the future-based dropdown when `isFuturesEnabled` is true.
  Widget _buildFutureDropdown() {
    return MultiDropdown.future(
      future: () async {
        // Use the provided future or default logic.
        final List<DropdownItem<Object>> items =
            await (fetchAnswersFuture?.call() ?? _defaultFuture());
        return items;
      },
      onSelectionChange: (value) {
        if (selectionListAnswerMethodObject != null) {
          selectionListAnswerMethodObject!(value);
        }
      },
      searchEnabled: searchEnabled,
      singleSelect: isSingleSelect,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select at least one answer';
        }
        return null;
      },
      closeOnBackButton: true,
      fieldDecoration: _fieldDecoration(),
    );
  }

  /// A default future method in case none is provided.
  Future<List<DropdownItem<Object>>> _defaultFuture() async {
    // Example delay - replace with actual async fetching logic.
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(
      answers.length,
      (index) => DropdownItem(
        value: answers[index],
        label: answers[index],
      ),
    );
  }

  /// Decorations used across dropdown configurations.
  FieldDecoration _fieldDecoration() {
    return const FieldDecoration(
      labelText: 'Select answers',
      labelStyle: TextStyle(
        color: AppColors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: AppColors.black,
          width: 2,
        ),
      ),
    );
  }

  DropdownDecoration _dropdownDecoration() {
    return const DropdownDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      backgroundColor: AppColors.whiteBackGround,
    );
  }

  DropdownItemDecoration _dropdownItemDecoration() {
    return const DropdownItemDecoration(
      selectedBackgroundColor: AppColors.mainColor,
    );
  }

  SearchFieldDecoration _searchDecoration() {
    return const SearchFieldDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: AppColors.black,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: AppColors.black,
          width: 2,
        ),
      ),
      hintText: 'Search',
    );
  }

  ChipDecoration _chipDecoration() {
    return const ChipDecoration(
      backgroundColor: AppColors.grey,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      labelStyle: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
