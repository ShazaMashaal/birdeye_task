import 'package:birdeye_task/views/getPhoto/cubit.dart';
import 'package:birdeye_task/views/getPhoto/states.dart';
import 'package:birdeye_task/widgets/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetPhotoView extends StatelessWidget {
  const GetPhotoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>GetPhotoCubit(),
      child: CustomScaffold(
        title: 'Pick a Photo',
        child: BlocBuilder<GetPhotoCubit,GetPhotoStates>(

          builder:(context,state){
            final cubit=GetPhotoCubit.of(context);
            return Center(
            child: TextButton(
              onPressed: ()=>cubit.showMyDialog(context),
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey, offset: Offset(2, 2), blurRadius: 6)
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: Colors.blue[100],
                  ),
                  child: const Text(
                    "Pick a Photo",
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          );}
        ),
      ),
    );
  }
}
