import 'package:flutter/material.dart';

import '../widgets/search_form_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: const SearchFormField(),
    );
  }
}
