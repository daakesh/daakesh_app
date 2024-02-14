import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();
    nameController.text = user.userData.name ?? 'mahdi';
    emailController.text = user.userData.email?? 'iamdavid@gmail.com';
  }




  @override
  Widget build(BuildContext context) {
    return AuthenticationBackgroundWidget(
      widget: Scaffold(
        backgroundColor:ColorName.transparent,
        body: LayoutBuilderWidget(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: BlocBuilder<ProfileBloc,ProfileState>(builder: (_,state){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 70.0,),
                    Text('Personal Info',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize:36.0),),
                    const SizedBox(height: 39.0,),
                    Center(
                      child: Container(
                        width: 108.0,
                        height: 108.0,
                        decoration: const BoxDecoration(
                          color: ColorName.gainsboro,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(child: Icon(Icons.person_outline,size: 50.0,color: ColorName.white,),),
                      ),
                    ),
                    const SizedBox(height: 14.0,),
                    Center(child: Text('Change Photo',style: easyTheme.textTheme.bodyMedium!.copyWith(color: ColorName.black.withOpacity(0.5)),)),
                    const SizedBox(height: 23.0,),
                    Text('Name',style: easyTheme.textTheme.bodyMedium!.copyWith(color: ColorName.black.withOpacity(0.5)),),
                    TextFormFieldWidget(
                      controller: nameController,
                      enabled: state.isUpdateActive,
                    ),
                    const SizedBox(height: 40.0,),
                    Text('Email',style: easyTheme.textTheme.bodyMedium!.copyWith(color: ColorName.black.withOpacity(0.5)),),
                    TextFormFieldWidget(
                      controller: emailController,
                      enabled: state.isUpdateActive,
                    ),
                    const SizedBox(height: 40.0,),
                    Text('Password',style: easyTheme.textTheme.bodyMedium!.copyWith(color: ColorName.black.withOpacity(0.5)),),
                    TextFormFieldWidget(
                      controller: passwordController,
                      enabled: state.isUpdateActive,
                      obscureText: true,
                    ),
                    const SizedBox(height: 40.0,),
                    const Spacer(flex: 1,),
                    Center(
                      child: DefaultButtonWidget(
                          text: !state.isUpdateActive ? 'MAKE EDIT':'SAVE', onPressed: ()=>onMakeEdit(state.isUpdateActive)),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Center(
                      child:
                      OutlineButtonWidget(text: !state.isUpdateActive ? 'Cancel':'RESET AND CANCEL', onPressed: ()=>cancel(state.isUpdateActive)),
                    ),

                    const Spacer(flex: 1,),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  void onMakeEdit(bool isUpdateActive){
    ProfileBloc.get.add(ActivateUpdateEvent(isUpdatePersonalActive: true));
  }
  void cancel(bool isUpdateActive){
    getBack();
    ProfileBloc.get.add(ActivateUpdateEvent(isUpdatePersonalActive: false));
  }



}
