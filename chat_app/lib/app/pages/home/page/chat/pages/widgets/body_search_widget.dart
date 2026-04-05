import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/pages/home/page/chat/pages/bloc/search_bloc.dart';
import 'package:chat_app/app/pages/home/page/chat/pages/bloc/search_event.dart';
import 'package:chat_app/app/pages/home/page/chat/pages/bloc/search_state.dart';
import 'package:chat_app/app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodySearchWidget extends StatefulWidget {
  const BodySearchWidget({super.key});

  @override
  State<BodySearchWidget> createState() => _BodySearchWidgetState();
}

class _BodySearchWidgetState extends State<BodySearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                context.router.pop();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: AppTextField(
                  hintText: "Search",
                  suffixIcon: Icon(Icons.search),
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (value) {
                    context.read<SearchBloc>().add(
                      OnSearchUserEvent(search: value),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  final user = state.searchResult[index];
                  return ListTile(
                    leading: CircleAvatar(),
                    title: Text("${user.fullName}"),
                  );
                },
                itemCount: state.searchResult.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              );
            },
          ),
        ),
      ],
    );
  }
}
