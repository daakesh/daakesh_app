import 'package:injectable/injectable.dart';
import '../../src.export.dart';

final editProduct = getIt.get<EditProduct>();

abstract class EditProduct {
  MyProductItem? myProductItem;
  void setData(MyProductItem myProductItem);
  void clearData();
}

@Singleton(as: EditProduct)
class EditProductImpl implements EditProduct {
  @override
  MyProductItem? myProductItem;

  @override
  void setData(MyProductItem myProductItem){
    this.myProductItem = myProductItem;
  }
  @override
  void clearData(){
    myProductItem = null;
  }













}
