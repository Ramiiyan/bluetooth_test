import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final List<BluetoothDevice> devicesList = new List<BluetoothDevice>();
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  @override
  _MyHomePageState createState() => _MyHomePageState();
  

}

class _MyHomePageState extends State<MyHomePage> {
    List<BluetoothService> _services;
    BluetoothDevice _connectectedDevice;
  @override
  void initState(){
    super.initState();
    widget.flutterBlue.connectedDevices
    .asStream()
    .listen((List<BluetoothDevice> devices){
      for(BluetoothDevice device in devices) {
        _addDeviceTolist(device);
      }
    });
    widget.flutterBlue.scanResults.listen((List<ScanResult> results){
      for(ScanResult result in results){
        _addDeviceTolist(result.device);
      }
    });
    widget.flutterBlue.startScan();
  }



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildView(),
    );
  }

  _addDeviceTolist(final BluetoothDevice device) {
   if (!widget.devicesList.contains(device)) {
     setState(() {
       widget.devicesList.add(device);
     });
   }
  } 
  ListView _buildListViewDevices(){
    List<Container> containers = new List<Container>();

    for(BluetoothDevice device in widget.devicesList){
      containers.add(
        Container(
          height: 50,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(device.name == '' ? '(unknown device)': device.name),
                    Text(device.id.toString()),
                  ],
                )
              ),
              FlatButton(
                color: Colors.blue,
                child: Text(
                  'Connect',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: (){
                  setState(() async {
                    widget.flutterBlue.stopScan();
                    try {
                      await device.connect();
                    } catch(e) {
                      if(e.code != 'already_connected'){
                        throw e;
                      }
                    }finally {
                      _services = await device.discoverServices();
                    }
                    _connectectedDevice = device;
                  });
                },
              )
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ...containers,
      ],
    );
  }
  
  ListView _buildView() {
    if(_connectectedDevice!= null) {
      return _buildConnectDeviceView();
    }else {
      return _buildListViewDevices();
    }
  }
  ListView _buildConnectDeviceView() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[],
    );
  }

  Widget connectBlueDevice(BluetoothDevice device, List<BluetoothService> _services){
    
  }

}

