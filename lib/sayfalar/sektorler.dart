import 'dart:convert';

import 'package:Crm_application/model/data_sektorler.dart';
import 'package:Crm_application/services/service_sektorler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        body: FutureBuilder(
          future: futureSektorler,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].name),
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
