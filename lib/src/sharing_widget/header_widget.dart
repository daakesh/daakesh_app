import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../src.export.dart';

class HeaderWidget extends StatefulWidget {
  final bool withArrowBack;
  final bool isLight;
  final double? height;
  final bool isSend;
  final int? requestID;

  const HeaderWidget({
    super.key,
    this.withArrowBack = true,
    this.isLight = false,
    this.height,
    this.isSend = false,
    this.requestID,
  });

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.isLight ? ColorName.white : ColorName.blueGray,
      ),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return SafeArea(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: Assets.svg.line.svg(
                      alignment: AlignmentDirectional.bottomEnd,
                      color: widget.isLight ? Colors.grey : null,
                    ),
                  ),
                  widget.withArrowBack
                      ? Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  state.switchLangValue
                                      ? ArabicDaakeshLogoWidget(
                                          isLight:
                                              widget.isLight ? false : true,
                                          width: 150,
                                        )
                                      : DaakeshLogoWidget(
                                          isLight:
                                              widget.isLight ? false : true,
                                          width: 160,
                                        ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 16.0),
                                child: Assets.svg.arrowBackIcon.svg(
                                    color: widget.isLight
                                        ? ColorName.blueGray
                                        : ColorName.white,
                                    height: 20.0,
                                    width: 20),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: state.switchLangValue
                                  ? ArabicDaakeshLogoWidget(
                                      isLight: widget.isLight ? false : true,
                                      width: 150,
                                    )
                                  : DaakeshLogoWidget(
                                      isLight: widget.isLight ? false : true,
                                      width: 184,
                                    ),
                            ),
                          ],
                        ),
                  widget.isSend
                      ? GestureDetector(
                          onTap: () =>
                              deleteItem(context, widget.requestID ?? 0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 16.0),
                            child: Assets.svg.deleteIcon.svg(
                              color: ColorName.red,
                              width: 24,
                              height: 24,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void deleteItem(BuildContext context, int id) {
    context.showRemoveDialog().then((value) {
      if (value != null && value == true) {
        MySwapOrderBloc.get.add(RemoveSendOfferItemEvent(id: id));
        Navigator.pop(context);
      }
    });
  }
}
