import 'package:Crm_application/model/data_sektorler.dart';
import 'package:Crm_application/services/service_sektorler.dart';
import 'package:flutter/material.dart';

class Sektorler extends StatefulWidget {
  @override
  _SektorlerState createState() => _SektorlerState();
}

class _SektorlerState extends State<Sektorler> {
  Future<List<SektorlerModel>> futureSektorler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureSektorler = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sektorler"),
        ),
        body:


        FutureBuilder(
          future: futureSektorler,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(

                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data[index].name),
                        subtitle:Text( snapshot.data[index].id),

                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
