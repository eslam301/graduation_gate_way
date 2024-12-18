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
      child: isFuturesEnabled
          ? _buildFutureDropdown(context)
          : _buildStandardDropdown(context),
    );
  }

  /// Builds the standard dropdown when `isFuturesEnabled` is false.
  Widget _buildStandardDropdown(context) {
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
      fieldDecoration: _fieldDecoration(context: context),
      dropdownDecoration: _dropdownDecoration(context),
      dropdownItemDecoration: _dropdownItemDecoration(context),
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
  Widget _buildFutureDropdown(context) {
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
      dropdownDecoration: _dropdownDecoration(context),
      dropdownItemDecoration: _dropdownItemDecoration(context),
      searchDecoration: _searchDecoration(),
      chipDecoration: _chipDecoration(),
      searchEnabled: searchEnabled,
      singleSelect: isSingleSelect,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select at least one answer';
        }
        return null;
      },
      closeOnBackButton: true,
      fieldDecoration: _fieldDecoration(context: context),
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
  FieldDecoration _fieldDecoration({required BuildContext context}) {
    final theme = Theme.of(context);
    return FieldDecoration(
      labelText: 'Select',
      hintStyle: theme.textTheme.bodyMedium,
      showClearIcon: true,
      labelStyle: theme.textTheme.bodyMedium,
      suffixIcon: const Icon(Icons.arrow_drop_down, color: AppColors.grey),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: theme.colorScheme.onSurface,
          width: 2,
        ),
      ),
    );
  }

  DropdownDecoration _dropdownDecoration(BuildContext context) {
    return DropdownDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }

  DropdownItemDecoration _dropdownItemDecoration(BuildContext context) {
    return DropdownItemDecoration(
        selectedBackgroundColor: Theme.of(context).colorScheme.surfaceTint,
        selectedIcon: const Icon(
          Icons.check,
          color: AppColors.mainColor,
        ));
  }

  SearchFieldDecoration _searchDecoration() {
    return const SearchFieldDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
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
