import 'package:Crm_application/model/data_gorusmeler.dart';
import 'package:Crm_application/services/service_gorusmeler.dart';
import 'package:flutter/material.dart';

class Gorusmeler extends StatefulWidget {
  Gorusmeler({Key key}) : super(key: key);

  @override
  _GorusmelerState createState() => _GorusmelerState();
}

class _GorusmelerState extends State<Gorusmeler> {
  Future<DataModelGorusmeler> _future;
   ServiceGorusmeler apiManager = ServiceGorusmeler();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = apiManager.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text("Görüşmeler"),
      ),
      body: _futureGorusmeler(context),
    );
  }

  _futureGorusmeler(BuildContext context) {
    return FutureBuilder<DataModelGorusmeler>(
        future: _future,
        builder: (context, AsyncSnapshot<DataModelGorusmeler> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.data.length,
                itemBuilder: (context, index) {
                  final _data = snapshot.data.data[index];
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      child: ListTile(
                        title: Text(_data.musteri),
                        subtitle: Text(_data.hizmet),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
