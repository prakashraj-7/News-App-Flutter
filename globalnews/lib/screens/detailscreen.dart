import 'package:flutter/material.dart';
import '../models/newsmodel.dart';
//import 'package:url_launcher/url_launcher.dart';
class Detailpage extends StatelessWidget {
  const Detailpage({super.key, required this.det});
  final Article det;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
           padding: const EdgeInsets.all(14.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                       Navigator.pop(context);

                    }, icon:const Icon(Icons.arrow_back_ios) ),
                    const SizedBox(width: 10,),
                    Text(det.author.toString(),style: const TextStyle(fontSize: 20),overflow:TextOverflow.ellipsis ,),
                  ],
                ),
                const SizedBox(height: 8,),
               ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(det.urlToImage.toString(), ),
               ),
               const SizedBox(
                height: 20,
               ),
               Row(children:[
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 108, 97),
                      width: 1.5,
                      
                      ),
                  ),
                  child: Text('${det.author}',style: const TextStyle(fontSize: 20),overflow:TextOverflow.ellipsis ,),
                  ),
                const Spacer(),
                Text('${det.publishedAt}')
               ] ),
               const SizedBox(height: 20,),
               Text(det.title.toString(),style: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
               const SizedBox(height: 20,),
              Text('${det.description}''${det.content} ...',style: const TextStyle(fontSize: 24),textAlign:TextAlign.justify,),
              const SizedBox(height: 15,),
                SelectableText('More About - ${det.url}',style: TextStyle(color: Colors.blue.shade300),) ,
              ],
            ),
          ),
        ),
      )
    );
  }
}

