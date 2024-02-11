import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../src.export.dart';

class MoreInfoProductScreen extends StatelessWidget {
  MoreInfoProductScreen({super.key});

  final controller = CarouselController();
  int current = 0;
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 17.5, end: 26.0, top: 12.0),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (_, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'By',
                        style: easyTheme.textTheme.bodyMedium!
                            .copyWith(fontSize: 20.0, color: ColorName.gray),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      !state.isDaakeshTodayDeal
                          ? const DaakeshLogoWidget(height: 28.0)
                          : Text(
                              'NF Store',
                              style: easyTheme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 20.0),
                            ),
                      const Spacer(
                        flex: 1,
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Assets.svg.zoomInIcon.svg(),
                      ),
                    ],
                  ),
                ),
                CarouselSlider(
                  carouselController: controller,
                  options: CarouselOptions(
                      height: 250.0,
                      viewportFraction: 1,
                      initialPage: 0,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        HomeBloc.get.add(ChangeProductSliderIndex(index: index));
                      }),
                  items: [1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Assets.png.glasses.image();
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [1, 2, 3].asMap().entries.map((entry) {
                    return InkWell(
                      onTap: () => controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: state.productSliderIndex == entry.key
                              ? ColorName.lightOrange
                              : ColorName.silverGray,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30.0,),
                Text(
                  'AquaOasis™ Cool Mist Humidefier (2.2L Water ',
                  style: easyTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 24.0, color: ColorName.gray),
                ),
                const SizedBox(height: 10.0,),
                Row(
                  children: [
                    RatingBar.builder(
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      minRating: 1,
                      maxRating: 5,
                      ignoreGestures: true,
                      initialRating: 4.5,
                      itemSize: 25.0,
                      tapOnlyMode: true,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Flexible(
                      child: Text(
                        '4.5',
                        style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 23.0,color: ColorName.black,overflow:TextOverflow.ellipsis ),
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Flexible(
                      child: Text(
                        '(200)',
                        style: easyTheme.textTheme.labelLarge!
                            .copyWith(fontSize: 21.0, color: ColorName.gray,overflow:TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14.0,),
                Row(
                  children: [
                    Text('\$44.',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 30.0,color: ColorName.black),),
                    Text('99 ',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 30.0, color: ColorName.gray,),),
                    const Spacer(flex: 1,),
                    Assets.svg.creditCardIcon.svg(width: 30.0,height: 22.0),



                  ],
                ),
                const SizedBox(height: 17.0,),
                Text('Size:',style: easyTheme.textTheme.labelSmall,),
                const SizedBox(height: 10.0,),
                SizedBox(
                    height: 60.0,
                    width: double.infinity,
                    child: CustomScrollView(
                      scrollDirection: Axis.horizontal,
                      slivers: [
                        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                          return Container(
                            width: 121.0,
                            height: 54.0,
                            margin: const EdgeInsetsDirectional.only(end: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                              border: Border.all(color: ColorName.gray),

                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('20L',style: easyTheme.textTheme.bodyLarge!.copyWith(height: 0.7,color: ColorName.blueGray.withOpacity(0.5)),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('\$44.',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 18.0,color: ColorName.black),),
                                    Text('99 ',style: easyTheme.textTheme.labelLarge!.copyWith(fontSize: 14.0, color: ColorName.gray,),),
                                  ],
                                ),


                              ],
                            ),
                          );
                        },childCount: 5)),
                      ],
                    )),
                const SizedBox(height: 14.0,),
                Text('Details:',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 22.0),),
                const SizedBox(height: 21.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Brand:',style: easyTheme.textTheme.bodyLarge!.copyWith(color: ColorName.gray,fontSize: 18.0),),
                    Text('Mac Cosmetics',style: easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18.0),),
                  ],
                ),
                const SizedBox(height: 13.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Model Name:',style: easyTheme.textTheme.bodyLarge!.copyWith(color: ColorName.gray,fontSize: 18.0),),
                    Text('Mac Cosmetics',style: easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18.0),),
                  ],
                ),
                const SizedBox(height: 13.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Category:',style: easyTheme.textTheme.bodyLarge!.copyWith(color: ColorName.gray,fontSize: 18.0),),
                    Text('Accessories',style: easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18.0),),
                  ],
                ),
                const SizedBox(height: 13.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Year:',style: easyTheme.textTheme.bodyLarge!.copyWith(color: ColorName.gray,fontSize: 18.0),),
                    Text('2022',style: easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18.0),),
                  ],
                ),
                const SizedBox(height: 13.0,),
                Text('description:',style: easyTheme.textTheme.bodyLarge!.copyWith(color: ColorName.gray,fontSize: 18.0),),
                const SizedBox(height: 13.0,),
                Text('AquaOasis™ Cool Mist Humidefier (2.2L WaterAquaOasis™ Cool Mist Humidefier (2.2L Water:',style: easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18.0),),
                const SizedBox(height: 29.0,),
                DefaultButtonWidget(text: 'ADD TO CART', onPressed: (){}),
                const SizedBox(height: 30.0,),
                Text('Rate',style: easyTheme.textTheme.headlineMedium!.copyWith(fontSize: 22.0),),
                const SizedBox(height: 14.0,),
                Container(
                  width: double.infinity,
                  height: 185.0,
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 19.22),
                  decoration: const BoxDecoration(
                    color: ColorName.silverSand,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child:  Column(
                    children: [
                      const SizedBox(height: 22.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        RatingBar.builder(
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          minRating: 1,
                          maxRating: 5,
                          initialRating: 4.5,
                          itemSize: 25.0,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        Assets.svg.sendIcon.svg(width: 27.0,height: 27.0),
                      ],),
                      const SizedBox(height: 18.0,),
                      Container(
                        height: 103.0,
                        width: double.infinity,
                        padding: const EdgeInsetsDirectional.only(start: 10.0,end:10,top: 7.0),
                        decoration: const BoxDecoration(
                          color: ColorName.white,
                          borderRadius: BorderRadius.all(Radius.circular(6.0))
                        ),
                        child: TextFormFieldWidget(
                          controller: commentController,
                          hintText: 'Comment',
                          isUnderlineOn: true,
                          maxLines: 3,
                        ),
                      ),



                    ],
                  ),
                ),
                const SizedBox(height: 12.0,),
                const Divider(color: ColorName.gray,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Comments',style: easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18.0),),
                    Text('(200)',style: easyTheme.textTheme.bodyLarge!.copyWith(fontSize: 18.0,color: ColorName.gray),),
                  ],
                ),
                const SizedBox(height: 23.0,),

                SizedBox(
                    height: 300.0,
                    width: double.infinity,
                    child: CustomScrollView(
                      slivers: [
                        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                          return Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(minHeight: 119.0),
                            margin: const EdgeInsetsDirectional.only(bottom: 12.0),
                            padding: const EdgeInsetsDirectional.symmetric(horizontal: 12.0),
                            decoration: const BoxDecoration(
                              color: ColorName.silverSand,
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),

                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 12.0,),
                                SizedBox(
                                  height: 40.0,
                                  child: Row(children: [
                                    Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: const BoxDecoration(
                                          color: ColorName.amber,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    const SizedBox(width: 12.0,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        Text('Khalil Ahmad',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 16.0),),
                                        Text('4 minutes ago',style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 11.0,color: ColorName.grayishBlue),),

                                      ],),
                                    ),
                                    RatingBar.builder(
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      minRating: 1,
                                      maxRating: 5,
                                      ignoreGestures: true,
                                      initialRating: 4.5,
                                      itemSize: 15.0,
                                      tapOnlyMode: true,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                    const SizedBox(width: 6.0,),
                                    Text('4.5',style: easyTheme.textTheme.labelSmall!.copyWith(fontSize:14.0),),




                                    ],),
                                ),
                                const SizedBox(height: 16.0,),
                                Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a imperdiet arcu. Vestibulum sit amet interdum mi.',
                                style: easyTheme.textTheme.bodyMedium!.copyWith(fontSize: 14.0),
                                ),
                                const SizedBox(height: 8.0,),

                              ],
                            ),
                          );
                        },childCount: 5)),
                      ],
                    )),





                const SizedBox(height: 40.0,),

              ],
            );
          },
        ),
      ),
    );
  }
}


