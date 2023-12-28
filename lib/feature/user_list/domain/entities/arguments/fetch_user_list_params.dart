// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FetchUserListParams {
  final int page;
  FetchUserListParams(this.page);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
    };
  }

  String toJson() => json.encode(toMap());
}
