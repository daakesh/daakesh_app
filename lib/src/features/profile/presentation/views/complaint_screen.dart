import 'package:flutter/material.dart';
import '../../../../src.export.dart';

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
    ComplaintType.Seller,
  ];

  String? complaintValue;

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 108.0,
                ),
                Text(
                  'Complaint',
                  style: context.easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 36.0),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Text(
                  'Location info',
                  style: context.easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 25.0),
                ),
                const SizedBox(
                  height: 19.0,
                ),
                Text(
                  'This information is required to allow your customers to communicate with you. Your account information is used if it is not changed',
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 16.0),
                ),
                const SizedBox(
                  height: 21.0,
                ),
                Text(
                  'Complaint Type',
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(color: ColorName.black.withOpacity(0.5)),
                ),
                DropDownButtonWidget<String>(
                  onChange: (value) {
                    complaintTypeController.text = value.toString();
                  },
                  value: complaintValue,
                  items: complaintTypeList
                      .map((e) => DropdownMenuItem(
                          value: e.index.toString(),
                          child: Text(e.name.toString())))
                      .toList(),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Seller Name',
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(color: ColorName.black.withOpacity(0.5)),
                ),
                TextFormFieldWidget(
                  controller: sellerNameController,
                  focusNode: sellerNameFocusNode,
                  onFieldSubmitted: (value) => Utils.fieldFocusChange(
                      context, sellerNameFocusNode, subjectFocusNode),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Subject',
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(color: ColorName.black.withOpacity(0.5)),
                ),
                TextFormFieldWidget(
                  controller: subjectController,
                  focusNode: subjectFocusNode,
                  onFieldSubmitted: (value) => Utils.fieldFocusChange(
                      context, subjectFocusNode, remarkFocusNode),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Remark',
                  style: context.easyTheme.textTheme.bodyMedium!
                      .copyWith(color: ColorName.black.withOpacity(0.5)),
                ),
                TextFormFieldWidget(
                  controller: remarkController,
                  focusNode: remarkFocusNode,
                ),
                const SizedBox(
                  height: 44.0,
                ),
                const Spacer(
                  flex: 1,
                ),
                Center(
                  child: DefaultButtonWidget(
                    text: 'SEND',
                    onPressed: onSend,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Center(
                  child: OutlineButtonWidget(text: 'Cancel', onPressed: cancel),
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

  void onSend() {
    if (complaintTypeController.text.isEmpty ||
        sellerNameController.text.isEmpty ||
        subjectController.text.isEmpty ||
        remarkController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(message: 'Fill all data firstly');
      return;
    }
    ComplaintBloc.get.add(AddComplaintEvent(
      complaintType: complaintTypeController.text,
      sellerName: sellerNameController.text,
      subject: subjectController.text,
      remark: remarkController.text,
    ));
  }
}
