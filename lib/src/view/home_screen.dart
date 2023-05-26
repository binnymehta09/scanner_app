import 'package:flutter/material.dart';
import 'package:scanner_app/src/view/qr_scanner_screen.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue.shade900,
        title: const Text(
          'Scanner App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        /// QR code scanner button
        _buttonView(
            label: 'QR Code Scan',
            onPressed: () async {
              var res = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const QRScannerScreen()),
              );
              setState(() {
                result = res;
              });
            }),

        /// Barcode scanner button
        _buttonView(
            label: 'Barcode Scan',
            onPressed: () async {
              var res = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SimpleBarcodeScannerPage(
                          scanType: ScanType.qr,
                        )),
              );
              setState(() {
                result = res;
              });
            }),
      ]),
    );
  }

  Widget _buttonView({String? label, void Function()? onPressed}) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10),
      child: ElevatedButton(onPressed: onPressed, child: Text(label!)),
    );
  }
}
