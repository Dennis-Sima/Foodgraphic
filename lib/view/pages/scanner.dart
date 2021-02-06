import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flushbar/flushbar_route.dart' as route;

class ScanShopPage extends StatefulWidget {
  @override
  _ScanShopPageState createState() => _ScanShopPageState();
}

class _ScanShopPageState extends State<ScanShopPage> {
  bool _flashOn = false; //bool for flashlight toggle
  GlobalKey qrKey = GlobalKey();
  QRViewController _controller;

  // bool for deactivating Scanner so it does not lead to this Error:
  // Scanner scanned multiple times,
  // so the app created mutliple tokens and backend route returned an error
  var textController = TextEditingController();
  var maskFormatter = MaskTextInputFormatter(
    mask: '####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Barcode Scanner"),
          elevation: 0,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                MdiIcons.helpCircleOutline,
                color: Colors.white,
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: Builder(builder: (context) {
          return Stack(
            children: [
              Align(
                alignment: Alignment(0, -0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.green),
                  child: ClipRRect(
                    //shapes the screen
                    borderRadius: BorderRadius.circular(15.0),
                    child: QRView(
                      key: qrKey,
                      overlay: QrScannerOverlayShape(
                        cutOutSize: 300,
                        borderLength: 40,
                        borderColor: Colors.white,
                      ),
                      onQRViewCreated: _onQRViewCreated,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.8),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.45,
                  color: Colors.white,
                  // Input field for QR Code on Scanpage
                  child: TextField(
                    controller: textController,
                    inputFormatters: [maskFormatter],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    autofocus: false,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      hintText: '1234-5678',
                      prefixIcon: Icon(Icons.search),
                      fillColor: Colors.white,
                    ),
                    onSubmitted: (value) {},
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0.8),
                child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width * 0.55,
                  child: RaisedButton.icon(
                    color: Colors.white,
                    icon: Icon(_flashOn ? Icons.flash_on : Icons.flash_off),
                    label: Text(
                      "Taschenlampe",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        _flashOn = !_flashOn;
                      });
                      _controller.toggleFlash();
                    },
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

// scanning logic
  void _onQRViewCreated(QRViewController controller) {}

  void _submitShopId(String shopId) {}

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
