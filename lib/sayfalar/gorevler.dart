import 'package:flutter/material.dart';
import '../model/data_gorevler.dart';
import '../services/service_gorevler.dart';

class Gorevler extends StatefulWidget {
  @override
  _GoverlerState createState() => _GoverlerState();
}

class _GoverlerState extends State<Gorevler> {
  final Service apiManager = Service();
  Future<DataModel> _future;

  @override
  void initState() {
    _future = apiManager.fetchData();
    print("1");
    super.initState();
    setState(() {
      print("dfgsdfg");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Görevler"),
      ),
      body: _buildFutureBuilder(context),
    );
  }

  _buildFutureBuilder(BuildContext context) {
    return FutureBuilder<DataModel>(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<DataModel> snapshot) {
        /// Gets adlı modelin içindeki data ile snapshot içindeki data karışmasın
        /// diye [_data] isimli değişken oluşturduk.

        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () {
              print("sdfasfasfasf");
            },
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
                print("4");
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
