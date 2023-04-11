import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/newsapiservice.dart';
import '../models/newsmodel.dart';



final newsdataProvider = FutureProvider<List<Article>>((ref) async {
   String countryname= 'in';
  return ref.watch(apiProvider).getdata(countryname); 
});


