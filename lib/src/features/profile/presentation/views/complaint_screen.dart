import 'package:flutter/material.dart';
import '../../../../src.export.dart';
import 'package:collection/collection.dart';

// ignore: must_be_immutable
class ComplaintScreen extends StatelessWidget {
  ComplaintScreen({super.key});
  final complaintTypeController = TextEditingController();
  final sellerNameController = TextEditingController();
  final subjectController = TextEditingController();
  final remarkController = TextEditingController();
  final FocusNode sellerNameFocusNode = FocusNode();
  final FocusNode subjectFocusNode = FocusNode();
  final FocusNode remarkFocusNode = FocusNode();
  final List<ComplaintType> complaintTypeList = [
    ComplaintType.User,
    ComplaintType.General,
  ];

  String? complaintValue;

  @override
  Widget build(BuildContext context) {
    final List<String> complaintValues = [
      context.locale.user_complaint,
      context.locale.general_complaint,
    ];
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.0.sp),
                Text(
                  context.locale.complaint,
                  style: context.easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 36.0),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Text(
                  context.locale.complaint_details,
                  style: context.easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 25.0),
                ),
                const SizedBox(
                  height: 19.0,
                ),
                Text(
                  context.locale.profile_instruction,
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 16.0),
                ),
                const SizedBox(
                  height: 21.0,
                ),
                Text(
                  context.locale.complaint_type,
                  style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                      fontSize: 18.0, color: ColorName.black.withOpacity(0.5)),
                ),
                DropDownButtonWidget<String>(
                  onChange: (value) {
                    complaintTypeController.text = value.toString();
                  },
                  value: complaintValue,
                  items: complaintTypeList
                      .mapIndexed((index, e) => DropdownMenuItem(
                          value: e.index.toString(),
                          child: Text(complaintValues[index])))
                      .toList(),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  context.locale.subject,
                  style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                      fontSize: 18.0, color: ColorName.black.withOpacity(0.5)),
                ),
                TextFormFieldWidget(
                  controller: subjectController,
                  focusNode: subjectFocusNode,
                  onFieldSubmitted: (value) => Utils.fieldFocusChange(
                      context, subjectFocusNode, remarkFocusNode),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  context.locale.remark,
                  style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                      fontSize: 18.0, color: ColorName.black.withOpacity(0.5)),
                ),
                TextFormFieldWidget(
                  controller: remarkController,
                  focusNode: remarkFocusNode,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Spacer(
                  flex: 1,
                ),
                Center(
                  child: DefaultButtonWidget(
                    text: context.locale.send,
                    onPressed: () => onSend(context),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: OutlineButtonWidget(
                      text: context.locale.cancel, onPressed: cancel),
                ),
                const SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void cancel() {
    Utils.getBack();
  }

  void onSend(BuildContext context) {
    if (complaintTypeController.text.isEmpty ||
        subjectController.text.isEmpty ||
        remarkController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(message: context.locale.fill_data);
      return;
    }
    ComplaintBloc.get.add(AddComplaintEvent(
      context: context,
      complaintType: complaintTypeController.text,
      sellerName: sellerNameController.text,
      subject: subjectController.text,
      remark: remarkController.text,
    ));
  }
}
