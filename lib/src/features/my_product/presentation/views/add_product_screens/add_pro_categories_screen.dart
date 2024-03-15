import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class AddProCategoriesScreen extends StatefulWidget {
  const AddProCategoriesScreen({super.key});

  @override
  State<AddProCategoriesScreen> createState() => _AddProCategoriesScreenState();
}

class _AddProCategoriesScreenState extends State<AddProCategoriesScreen> {
  final productModelYearController = TextEditingController(text: DateTime.now().year.toString());
    String? productSecID;
    String? productCatID;
    String? productSubCatID;
    String? productBrandID;
    String? productModelYear;

  @override
  void initState() {
    super.initState();
    editData();
  }




  @override
  Widget build(BuildContext context) {
    return  DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor:ColorName.transparent,
        body: LayoutBuilderWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 108.0,
                ),
                GestureDetector(
                  onTap:()=>getBack(),
                  child: Assets.svg.arrowBackIcon.svg(),
                ),
                const SizedBox(
                  height: 11.0,
                ),
                Text(
                  'Add Product',
                  style: easyTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 36.0),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Text(
                  'Add Product Categories',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Section',
                        style: easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5)),
                      ),
                      BlocConsumer<ProDetailsBloc, ProDetailsState>(
                        listener: (_,state){
                          if(getIt.get<EditProduct>().myProductItem != null){
                          productSecID =state.productSecID;
                          }
                        },
                        builder: (context, state) {
                          return DropDownButtonWidget<String>(
                            onChange: (value) {
                              getProBrand(value.toString());
                              getProCategory(value.toString());
                              productSecID = value.toString();
                            },
                            value: productSecID,
                            items: state.sectionListData
                                .map((e) => DropdownMenuItem(
                                    value: e.id.toString(),
                                    child: Text(e.name.toString())))
                                .toList(),
                          );
                        },
                      ),
                      const SizedBox(height: 21.0,),
                      Text(
                        'Product Categories',
                        style: easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5)),
                      ),
                      BlocConsumer<ProDetailsBloc, ProDetailsState>(
                        listener: (_,state){
                          productCatID =state.productCatID;
                        },
                        builder: (context, state) {
                          return DropDownButtonWidget<String>(
                            onChange: (value) {
                              productCatID = value.toString();
                              getProSubCategory(value.toString());
                            },
                            value: state.productCatID,
                            items: state.proCategoryListData.map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.name.toString())))
                                    .toList(),
                          );
                        },
                      ),
                      const SizedBox(height: 21.0,),
                      Text(
                        'Sup Categories',
                        style: easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5)),
                      ),
                      BlocConsumer<ProDetailsBloc, ProDetailsState>(
                        listener: (_,state){
                          productSubCatID =state.productSubCatID;
                        },
                        builder: (context, state) {
                          return DropDownButtonWidget<String>(
                            onChange: (value) {
                              productSubCatID = value.toString();
                            },
                            value: state.productSubCatID,
                            items: state.proSubCategoryListData
                                .map<DropdownMenuItem<String>>((e) =>
                                    DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.name.toString())))
                                .toList(),
                          );
                        },
                      ),
                      const SizedBox(height: 21.0,),
                      Text(
                        'Product Brand',
                        style: easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5)),
                      ),
                      BlocConsumer<ProDetailsBloc, ProDetailsState>(
                        listener: (_,state){
                          productBrandID =state.productBrandID;
                        },
                        builder: (context, state) {
                          return DropDownButtonWidget<String>(
                            onChange: (value) {
                              productBrandID = value.toString();
                            },
                            value: state.productBrandID,
                            items:state.proBrandListData
                                .map((e) => DropdownMenuItem(
                                    value: e.id.toString(),
                                    child: Text(e.name.toString())))
                                .toList() ,
                          );
                        },
                      ),
                      const SizedBox(height: 21.0,),
                      Text(
                        'Product Model Year',
                        style: easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5)),
                      ),
                      TextFormFieldWidget(
                        controller: productModelYearController,
                        isSuffixPrefixOn: true,
                        readOnly: true,
                        suffixIcon: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: Center(child: Assets.svg.arrowDropDownIcon.svg())),
                        onTap:()=>selectModelYear(context),
                      ),
                      const SizedBox(height: 70.0,),
                    ],
                  ),
                ),
                const Spacer(flex: 1,),
                Center(
                  child: DefaultButtonWidget(
                      text:'NEXT', onPressed: ()=>onNext()),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Center(
                  child: OutlineButtonWidget(text:'CANCEL', onPressed: ()=>cancel()),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                const Spacer(flex: 1,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onNext()async{
    AddProBloc.get.add(AddProCategoriesEvent(
     productSecID: productSecID.toString(),
     productCatID: productCatID.toString(),
     productSubCatID: productSubCatID.toString(),
     productBrandID: productBrandID.toString(),
     productModelYear: productModelYearController.text,
   ));
   openNewPage(const AddProImagesScreen());
  }
  void cancel(){
    getBack();
    resetData();
  }
  void resetData(){}
  void getProCategory(String secID){
    ProDetailsBloc.get.add(GetProCategoryEvent(secID: secID));
  }
  void getProBrand(String secID) {
    ProDetailsBloc.get.add(GetBrandsBySectionEvent(secID: secID));
  }
  void getProSubCategory(String catID){
     ProDetailsBloc.get.add(GetProSubCategoryEvent(catID: catID));
   }
  void selectModelYear(context)async{
     await showModalBottomSheet<int>(
       context: context,
       builder: (BuildContext builder) {
         return SizedBox(
           height: MediaQuery.of(context).copyWith().size.height / 3,
           child: CupertinoDatePicker(
             mode: CupertinoDatePickerMode.monthYear,
            initialDateTime: DateTime(int.parse(productModelYearController.text)),
            minimumYear: 1900,
             maximumYear: 2100,
             onDateTimeChanged: (DateTime newDateTime) {
                 productModelYearController.text = newDateTime.year.toString();
             },
           ),
         );
       },
     );
   }
  void editData(){
    ProDetailsBloc.get.add(GetDropDownDataEvent());
  }

}


