import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {

  final complaintTypeController = TextEditingController();
  final sellerNameController = TextEditingController();
  final subjectController = TextEditingController();
  final remarkController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return  AuthenticationBackgroundWidget(
      widget: Scaffold(
        backgroundColor:ColorName.transparent,
        body: LayoutBuilderWidget(
          child: BlocBuilder<ProfileBloc, ProfileState>(builder: (_, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 108.0,
                  ),
                  Text(
                    'Complaint',
                    style: easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 36.0),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Text(
                    'Location info',
                    style: easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 25.0),
                  ),
                  const SizedBox(
                    height: 19.0,
                  ),
                  Text(
                    'This information is required to allow your customers to communicate with you. Your account information is used if it is not changed',
                    style: easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 21.0,
                  ),

                  Text(
                    'Complaint Type',
                    style: easyTheme.textTheme.bodyMedium!
                        .copyWith(color: ColorName.black.withOpacity(0.5)),
                  ),
                  TextFormFieldWidget(
                    controller: complaintTypeController,
                    keyboardType: TextInputType.number,
                    readOnly: true,
                    isSuffixPrefixOn: true,
                    suffixIcon: InkWell(
                      onTap: () {},
                        child: const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: ColorName.blueGray,
                          size: 35.0,
                        ),
                      )),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'Seller Name',
                    style: easyTheme.textTheme.bodyMedium!
                        .copyWith(color: ColorName.black.withOpacity(0.5)),
                  ),
                  TextFormFieldWidget(
                      controller: sellerNameController,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'Subject',
                    style: easyTheme.textTheme.bodyMedium!
                        .copyWith(color: ColorName.black.withOpacity(0.5)),
                  ),
                  TextFormFieldWidget(
                    controller: subjectController,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'Remark',
                    style: easyTheme.textTheme.bodyMedium!
                        .copyWith(color: ColorName.black.withOpacity(0.5)),
                  ),
                  TextFormFieldWidget(
                    controller: remarkController,
                  ),

                  const SizedBox(
                    height: 44.0,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Center(
                    child: DefaultButtonWidget(
                        text: 'SEND', onPressed: onSend),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Center(
                    child:
                    OutlineButtonWidget(text: 'Cancel', onPressed:cancel),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  void onSend(){}

  void cancel(){getBack();}
}
