import 'package:book_list/services/app_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Check book count", () async {
    AppService service = AppService();
    var items = await service.get(100);

    expect(100, items.length);
  });
}
