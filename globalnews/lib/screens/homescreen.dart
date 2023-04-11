import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../darkmode/darkmode.dart';
import '../models/newsmodel.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../providers/news_provider.dart';
import 'detailscreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class HomePage extends ConsumerWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsbbc = ref.watch(newsdataProvider);
   
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
     var darkMode = ref.watch(darkModeProvider);
   
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: const Color.fromARGB(255, 255, 126, 116),
      displacement: 70,
      strokeWidth: 3,
      onRefresh: () async{
     
        // ignore: unused_result
        await Future.delayed(const Duration(milliseconds: 1500)); ref.refresh(newsdataProvider);
      },
      child: Scaffold(
        // drawer: Drawer(
         
        //   child: ListView(
        //     children: [
        //       TextButton(onPressed: (){
            
        //       }, child: Text('amerca')),
        //       DrawerHeader(
        //         decoration: BoxDecoration(
        //           color: Colors.red,
        //         ),
        //         child:Text('data') ),
        //       // DropdownButton(
        //       //   items: ,
        //       //   onChanged: (value) {
        //       //     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()))
        //       //   }),
              
        //     ],
            
        //   ),
          
        // ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color:  Color.fromARGB(255, 255, 126, 116)),
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0),
          title: const Text(
            'Global News',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 126, 116), fontSize: 30),
          ),
          actions: [      
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: FlutterSwitch(
                  inactiveColor: const Color.fromARGB(255, 255, 126, 116),
                  padding: 8.0,
                  height: 30.0,
                  width: 60,
                  activeColor: Colors.black,
                  value: darkMode,
                  onToggle: (val) {
                    ref.read(darkModeProvider.notifier).toggle();
                  }),
            ),
          ],
        
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: newsbbc.when(
                data: (newsbbc) {
                  List<Article> bbc = newsbbc.map((e) => e).toList();
    
                  return Column(
                   
                    children: [
                     
                      Expanded(
                       
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: bbc.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                              width: 100,
                              height: 100,
                              
                                
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                     MaterialPageRoute(builder:(context)=>Detailpage(det:bbc[index])));
                                    
                                  },
                                  child: ListTile(
                                                            
                                    visualDensity: const VisualDensity(vertical: 4),
                                    
                                    style: ListTileStyle.drawer,
                                                            
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                           bbc[index].urlToImage.toString(),
                                          
                                           width:150.0,height:200.0,fit: BoxFit.cover),
                                    ),              
                                    title: Text(
                                      '${bbc[index].title}',
                                      overflow: TextOverflow.fade,
                                      maxLines: 4,
                                      style: const TextStyle(fontSize: 16),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                },
                error: (error, stackTrace) => const Center(
                  
                  child: Text('No Internet Connection',
                  style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 255, 126, 116)),),
                ),
                loading: () => const Center(
                      child: SpinKitDualRing(
                        color: Color.fromARGB(255, 255, 126, 116),
                        size: 40,
                        duration: Duration(microseconds: 1000),
                      ),
                    )),
          ),
        ),
    
        // Container(
        //   child: newsbbc.when(
        //       data: (newsbbc) {
        //         List<Article> bbc = newsbbc.map((e) => e).toList();
    
        //         return Expanded(
        //           child: ListView.builder(
        //               itemCount: bbc.length,
        //               itemBuilder: (context, index) {
        //                 return ListTile(
        //                   trailing:
        //                       Image.network(bbc[index].urlToImage.toString()),
        //                   title: Text('${bbc[index].author}'),
        //                 );
        //               }),
        //         );
        //       },
        //       error: (error, stackTrace) => Text(error.toString()),
        //       loading: () => Center(
        //             child: CircularProgressIndicator(),
        //           )),
        // ),
       // bottomNavigationBar: BottomNavigationBar(items: List.empty()),
      ),
    );
  }
}
