import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterapi/cubit/user_cubit.dart';
import 'package:masterapi/cubit/user_state.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is GetUserFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: state is GetUserLoading ? Center(
                child: CircularProgressIndicator()) :
            state is GetUserSuccess?ListView(
        children: [
         SizedBox(height: 16),
        //! Profile Picture
        CircleAvatar(
        radius: 80,
        backgroundImage:NetworkImage(state.user.profilePic),
        ),
         SizedBox(height: 16),

        //! Name
         ListTile(
        title: Text(state.user.name),
        leading: Icon(Icons.person),
        ),
         SizedBox(height: 16),

        //! Email
         ListTile(
        title: Text(state.user.email),
        leading: Icon(Icons.email),
        ),
         SizedBox(height: 16),

        //! Phone number
         ListTile(
        title: Text(state.user.phone),
        leading: Icon(Icons.phone),
        ),
         SizedBox(height: 16),

        //! Address
         ListTile(
        title: Text(state.user.address["type"]),
        leading: Icon(Icons.location_city),
        ),
         SizedBox(height: 16),
        ]
        ,
        ):SizedBox()

        );
      },
    );
  }
}
