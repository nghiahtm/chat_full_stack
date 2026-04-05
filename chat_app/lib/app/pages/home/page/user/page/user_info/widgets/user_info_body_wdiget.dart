import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/pages/home/page/user/page/user_info/bloc/user_info_bloc.dart';
import 'package:chat_app/app/pages/home/page/user/page/user_info/bloc/user_info_event.dart';
import 'package:chat_app/app/pages/home/page/user/page/user_info/bloc/user_info_state.dart';
import 'package:chat_app/app/widgets/app_button.dart';
import 'package:chat_app/app/widgets/app_text_field.dart';
import 'package:chat_app/utils/themes/app_color.dart';
import 'package:chat_app/utils/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoBodyWidget extends StatefulWidget {
  const UserInfoBodyWidget({super.key});

  @override
  State<UserInfoBodyWidget> createState() => _UserInfoBodyWidgetState();
}

class _UserInfoBodyWidgetState extends State<UserInfoBodyWidget> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserInfoBloc>().add(const GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserInfoBloc, UserInfoState>(
      listener: (context, state) {
        if (state.userInfo != null) {
          fullNameController = TextEditingController(
            text: state.userInfo!.fullName,
          );
          emailController = TextEditingController(text: state.userInfo!.email);
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return Center(child: const CircularProgressIndicator());
        }
        return Column(
          children: [
            Column(
              spacing: 16,
              children: [
                AppTextField(
                  controller: fullNameController,
                  labelText: "Họ và tên",
                  enabled: false,
                ),
                AppTextField(
                  controller: emailController,
                  labelText: "Email",
                  enabled: false,
                ),
              ],
            ),
            const Spacer(),
            AppButton(
              onPressed: () {
                context.router.pop();
              },
              backgroundColor: AppColor.white,
              child: Text(
                "Cập nhật",
                style: TextStyleThemes.body.copyWith(color: AppColor.primary),
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
