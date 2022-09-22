import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/helpers/get_status_color.dart';
import 'package:test_task/screens/bloc/character_bloc.dart';
import 'package:test_task/screens/get_data.dart';
import 'package:test_task/screens/widgets/text_field_widget.dart';

class TestTask extends StatefulWidget {
  const TestTask({Key? key}) : super(key: key);

  @override
  State<TestTask> createState() => _TestTaskState();
}

class _TestTaskState extends State<TestTask> {
  CharacterBloc characterBloc = CharacterBloc();
  late final TextEditingController textEditingController =
      TextEditingController();

  @override
  void initState() {
    characterBloc.add(GetCharactersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.purple[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            child: CustomTextField(controller: textEditingController),
          ),
          SizedBox(height: 10.h),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => GetDataScreen(
                        data: textEditingController.text,
                      )),
                ),
              );
            },
            child: Text('Save'),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff354545),
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          BlocConsumer<CharacterBloc, CharacterState>(
            bloc: characterBloc,
            listener: (context, state) {
              if (state is CharacterErrorState) {
                print('object3');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.error.toString(),
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              print('state');
              if (state is CharacterLoadingState) {
                print('');
                return const Center(child: CircularProgressIndicator());
              }

              if (state is CharacterLoadedState) {
                print({state.characterModelList.results!.length});
                return SizedBox(
                  width: 1.sw,
                  height: 550.h,
                  child: ListView.separated(
                    itemCount: state.characterModelList.results!.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 15.h);
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: SizedBox(
                          height: 95.h,
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 35.r,
                                backgroundImage: NetworkImage(state
                                    .characterModelList.results![index].image!),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.characterModelList.results![index]
                                          .status
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: getStatusColor(state
                                            .characterModelList
                                            .results![index]
                                            .status
                                            .toString()),
                                      ),
                                    ),
                                    Text(
                                      state.characterModelList.results![index]
                                          .name!,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          state.characterModelList
                                              .results![index].species
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          state.characterModelList
                                              .results![index].gender
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
