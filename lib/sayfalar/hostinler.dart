import 'package:Crm_application/model/data_hostingler.dart';
import 'package:Crm_application/services/service_hostingler.dart';
import 'package:flutter/material.dart';

class Hostinler extends StatefulWidget {
  Hostinler({Key key}) : super(key: key);

  @override
  _HostinlerState createState() => _HostinlerState();
}

class _HostinlerState extends State<Hostinler> {

  ServiceHostingler apiManager = ServiceHostingler();
  Future<DataModelHostingler> _future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = apiManager.fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}