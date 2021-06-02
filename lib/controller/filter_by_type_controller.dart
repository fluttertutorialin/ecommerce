import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

enum SortByType {
  START_DATE,
  UPDATED_AT,
  CREATED_AT,
  DISTANCE,
  EVENT_TYPE,
}

class FilterByTypeController extends GetxController with EquatableMixin {
  late SortByType? sortByType;
  late String? title;
  late RxBool? isSelected = false.obs;

  FilterByTypeController({this.sortByType, this.title, this.isSelected});

  @override
  // TODO: implement props
  List<Object?> get props => [sortByType, title, isSelected];
}