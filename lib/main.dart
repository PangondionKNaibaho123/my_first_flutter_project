import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wisata Tomok",
      theme: ThemeData.dark(),
      home: detailScreen(),
    );
  }
}

class detailScreen extends StatelessWidget {
  TextEditingController donasiInputText = TextEditingController();
  String donasi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wisata Samosir"
        ),
      ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
      Container(
        child: Image.asset('sourceimages/makam_raja_sidabutar.jpeg',
            width: 400, height: 300),
      ),
      Container(
        margin: EdgeInsets.only(top: 16.0),
        child: Text(
          "Makam Raja Sidabutar",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(children: <Widget>[
              Icon(Icons.calendar_today),
              SizedBox(height: 8.0),
              Text("Senin-Sabtu")
            ]),
            Column(children: <Widget>[
              Icon(Icons.access_time),
              SizedBox(height: 8.0),
              Text("08.00-17.00")
            ]),
            Column(children: <Widget>[
              Icon(Icons.monetization_on),
              SizedBox(height: 8.0),
              Text("Rp 20.000,-")
            ])
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "Makam Raja Sidabutar berada di dekat pelabuhan Tomok, setelah kita beranjak dari pelabuhan, kita dapat menempuh jalan sejauh 150 meter untuk menuju kesana. Kita dapat jalan kaki, atau menaiki transportasi yang disediakan seperti becak. Banyak sejarah yang tertulis di makam ini berupa pengetahuan mengenai kerajaan di tanah Batak. Selain itu, di sekitar makam ini banyak souvenir shop, dan juga tempat-tempat yang instagramable",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      Container(
          width: 350.0,
          alignment: Alignment.center,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      height: 300,
                      width: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image.asset("sourceimages/museum_batak_tomok.jpeg")
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image.asset("sourceimages/sigale_gale.jpeg")
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                                child: Image.asset("sourceimages/toko_souvenir.jpeg")
                            )
                          ]
                      )
                  ),
                ],
              )
            ],
          )
      ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text(
                "Ingin berdonasi? silahkan menuju halaman donasi di bawah",
                textAlign: TextAlign.center,
              ),
              FlatButton(
                color: Colors.teal,
                child: Text(
                  "Donasi di sini"
                ),
                splashColor: Colors.blueGrey,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return donasiScreen();
                  }));
                },
              )
            ],

          )
        ),
    ]
            )
        )
    );
  }
}

class donasiScreen extends StatelessWidget{

  final List<String> namaBankList = <String>["Mandiri","BNI","BRI","BCA"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Laman Donasi",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pilih donasi anda melalui:",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ),
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: List<Widget>.generate(
                        namaBankList.length,
                            (int index){
                          return Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                              child: Text(
                                "${namaBankList[index]}",
                                style: TextStyle(fontSize: 20, color: Colors.black),
                              ),
                            ),
                          );
                        }
                    )
                ),
              )
            )
          ],
        ),
      )
    );
  }
  
}
