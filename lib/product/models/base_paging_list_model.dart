import 'dart:convert';

class BasePagingListModel<T> {
  final int pageCount;
  final int itemPerPage;
  final int totalItem;
  final int totalPageCount;
  List<T> items;

  BasePagingListModel({
    required this.pageCount,
    required this.itemPerPage,
    required this.totalItem,
    required this.totalPageCount,
    required this.items,
  });

  factory BasePagingListModel.fromJson(final String str, final T Function(Map<String, dynamic>) mappingFunction) =>
      BasePagingListModel.fromMap(json.decode(str), mappingFunction);

  factory BasePagingListModel.fromMap(
    final Map<String, dynamic> json,
    final T Function(Map<String, dynamic>) mappingFunction,
  ) {
    return BasePagingListModel<T>(
      pageCount: json["page"],
      itemPerPage: json["per_page"],
      totalItem: json["total"],
      totalPageCount: json["total_pages"],
      items:
          List<T>.from((json["data"] as List<dynamic>).map((e) => mappingFunction(e as Map<String, dynamic>))).toList(),
    );
  }

  BasePagingListModel<T> parseListModel(final T Function(Map<String, dynamic>) mappingFunction) {
    return BasePagingListModel<T>(
      pageCount: pageCount,
      itemPerPage: itemPerPage,
      totalItem: totalItem,
      totalPageCount: totalPageCount,
      items: List<T>.from(
        items.map(
          (final x) => mappingFunction(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
