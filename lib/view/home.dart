import 'package:flutter/material.dart';
import 'package:isroapi/services/isroapi.dart';

import '../model/isromodel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    Isro().getIsro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
       title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ISRO ',
              style: TextStyle(
               color:Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'LAUNCHES',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/rocket.png'),fit: BoxFit.cover)
        ),
        child: Column(
          children: [
           
            // Image.asset('assets/rocket.png',height: 400,
            // width: double.infinity,),
            Expanded(
              child: FutureBuilder<List<Isromodel>>(
                  future: Isro().getIsro(),
                  builder: (context, snashot) {
                    if (!snashot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Container(
                        
                        child: ListView.builder(
                            itemCount: snashot.data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    // height: 170,
                                    width: 400,
                                    child: Card(
                                      color: Color.fromARGB(255, 217, 130, 37),
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(snashot.data![index].name.toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                                              Text(snashot.data![index].launchType.toString(),style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.white)),
                                              Text(snashot.data![index].launchDate.toString(),style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.white)),
                                              Text(snashot.data![index].missionStatus.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  //     title:
                                          // Text(snashot.data![index].name.toString()),
                                          // Text(snashot.data![index].launchType.toString()),
                                          // Text(snashot.data![index].launchDate.toString()),
                                          // Text(snashot.data![index].missionStatus.toString()),
                                ],
                              );
                             
                            }),
                      );
                    }
                   
                  }),
            )
          ],
        ),
      ),
    );
  }
}
