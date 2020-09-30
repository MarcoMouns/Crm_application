import 'package:flutter/material.dart';
import '../model/data_gorevler.dart';
import '../services/service_gorevler.dart';

class Gorevler extends StatefulWidget {
  @override
  _GoverlerState createState() => _GoverlerState();
}

class _GoverlerState extends State<Gorevler> {
  final ServiceGorevler apiManager = ServiceGorevler();
  Future<DataModelGorevler> _future;

  @override
  void initState() {
    _future = apiManager.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Görevler"),
      ),
      body: _futureGorevler(context),
    );
  }

  _futureGorevler(BuildContext context) {
    ///ne zaman biteceği belli olmayan yapılarda arayüzü yapıp sonrasında veri gelince bu arayüzü kullanmak için futurebuilder kullanıyoruz
    return FutureBuilder<DataModelGorevler>(
      future: _future,
      builder:
          (BuildContext context, AsyncSnapshot<DataModelGorevler> snapshot) {
        ///snapshot = o an gelen değer
        /// Gets adlı modelin içindeki data ile snapshot içindeki data karışmasın
        /// diye [_data] isimli değişken oluşturduk.

        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () {},
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.data.length,
              itemBuilder: (BuildContext context, int index) {
                final _data = snapshot.data.data[index];

                return InkWell(
                  onTap: () {
                    debugPrint("gdfg");
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        _data.gorev,
                      ),
                      subtitle: Text(
                        _data.durum,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
