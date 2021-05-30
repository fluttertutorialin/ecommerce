import 'package:ecommerce/import_package.dart';
import 'package:ecommerce/model/get/home/home_response.dart';

class CustomItemHome extends StatelessWidget {
  final HomeResponse homeResponse;
  CustomItemHome({required this.homeResponse});

  @override
  Widget build(BuildContext context) => Card(
      color: AppColors.whiteCardBackground,
      child: Container(
          padding: EdgeInsets.all(5),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CircleAvatar(child: Text('${homeResponse.userId!}')),
            SizedBox(width: 10),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text('${homeResponse.id!}'),
                  SizedBox(height: 3),
                  Text('${homeResponse.body!}')
                ]))
          ])));
}
