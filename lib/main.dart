import 'package:Crm_application/sayfalar/devameden_projetipi.dart';
import 'package:Crm_application/sayfalar/gorusmeler.dart';
import 'package:Crm_application/sayfalar/hosting_sureleri.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_sayfa.dart';
import 'sayfalar/gorevler.dart';
import 'sayfalar/onaylanan_musteriler.dart';
import 'sayfalar/sektorler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SRM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginSayfa(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Essente Bilişim"),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // mainAxisSpacing: 40,
            //crossAxisSpacing: 50,
          ),
          itemCount: _islemler.length,
          itemBuilder: (context, index) {
            return Center(
              child: InkWell(
                  onTap: () {
                    print("dsfsfsfsfs");
                    setState(() {
                      switch (index) {
                        case 0:
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Gorevler()));
                          }
                          break;
                        case 1:
                          {
                            //sayfa rotası
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Sektorler()));
                          }
                          break;
                        case 2:
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OnaylananMusteri()));
                          }
                          break;
                        case 3:
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DevamedenProjetipi()));
                          }
                          break;
                        case 4:
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Gorusmeler()));
                          }
                          break;
                        case 5:
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HostingSureleri()));
                          }
                          break;
                        default:
                          {}
                          break;
                      }
                    });
                  },
                  child: CardIslem(islemler: _islemler[index])),
            );
          }),
    );
  }
}

class Islemler {
  final String title;
  final IconData icon;

  const Islemler({this.title, this.icon});
}

const List<Islemler> _islemler = const <Islemler>[
  const Islemler(title: 'Görevler', icon: Icons.add_circle_outline_outlined),
  const Islemler(title: 'Sektörler', icon: Icons.eight_k_plus),
  const Islemler(title: 'Onaylanan Müşteriler', icon: Icons.person),
  const Islemler(title: 'Devam Eden Projeler', icon: Icons.add_to_queue),
  const Islemler(title: 'Görüşmeler', icon: Icons.bubble_chart_outlined),
  const Islemler(title: 'Hosting', icon: Icons.account_balance_wallet),
  const Islemler(title: 'Hostingler', icon: Icons.account_balance_wallet_sharp),
  const Islemler(title: 'Onaylanan Projeler', icon: Icons.analytics_rounded),
  const Islemler(title: 'Onaylanmayan Projeler', icon: Icons.access_time),
  const Islemler(title: 'Tamamlanan', icon: Icons.add_circle),
  const Islemler(title: 'Proje Bazlı Görevler', icon: Icons.add),
  const Islemler(title: 'Proje Bazlı Demo Linkleri', icon: Icons.add_link),
  const Islemler(title: 'Sektör Bazlı Demo Linkleri', icon: Icons.add_link),
];

class CardIslem extends StatefulWidget {
  CardIslem({this.islemler}) : super();
  Islemler islemler;

  @override
  _CardIslemState createState() => _CardIslemState();
}

class _CardIslemState extends State<CardIslem> {
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle =
        Theme.of(context).textTheme.subhead.apply(fontSizeFactor: 1.5);
    return Card(
      color: Colors.orangeAccent,
      child: Center(
        child: Column(
          //  mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Icon(
              widget.islemler.icon,
              size: 35,
              color: textStyle.color,
            )),
            Text(
              widget.islemler.title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

/*
Center(
        child: Container(height: 100,width: 300,
          child: RaisedButton(
              color: Colors.orangeAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text("GÖREVLER",style: TextStyle(fontSize: 50),),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Gorevler()));
              }),
        ),
      )
 */
