import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kbbi/bloc/CariDataBloc.dart';
import 'package:kbbi/models/responses/DataDetailResponse.dart';
import 'package:kbbi/pages/Detail.dart';

class Beranda extends StatefulWidget {
  Beranda({Key key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  TextEditingController editingController = TextEditingController();
  List<DataDetailResponse> dataKata;
  bool status;
  String message;
  bool isLoaded = true;
  final CariDataBloc cariDataBloc = CariDataBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kamus Besar Bahasa Indonesia'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onSubmitted: (kata) => getKata(kata),
                controller: editingController,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    labelText: "Cari Kata",
                    hintText: "Cari kata...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: !isLoaded
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : editingController.text.length == 0
                      ? Center(child: Text('Ketik kata di kolom pencarian'))
                      : dataKata.length == 0
                          ? Center(child: Text('Kata tidak ditemukan'))
                          : ListView.separated(
                              shrinkWrap: true,
                              itemCount: dataKata.length,
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    dataKata[index].lema,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Detail(
                                                    lema: dataKata[index].lema,
                                                    arti:
                                                        dataKata[index].arti)));
                                  },
                                );
                              },
                            ),
            ),
          ],
        ),
      ),
    );
  }

  void getKata(String kata) async {
    setState(() {
      isLoaded = false;
    });
    await cariDataBloc.ambilData(kata).then((value) {
      setState(() {
        status = value.status;
        message = value.message;
        dataKata = value.data;
        isLoaded = true;
      });
    }).catchError((onError) {
      setState(() {
        status = false;
        message = onError.toString();
        dataKata = [];
        isLoaded = true;
      });
    });
  }
}

Future<bool> cekInternet() async {
  bool adaInternet;
  int timeout = 5;
  try {
    http.Response response = await http
        .get(Uri.parse("https://new-kbbi-api.herokuapp.com/"))
        .timeout(Duration(seconds: timeout));
    if (response.statusCode == 200) {
      adaInternet = true;
    } else {
      adaInternet = false;
    }
  } on TimeoutException catch (e) {
    print('Timeout Error: $e');
    adaInternet = false;
  } on SocketException catch (e) {
    print('Socket Error: $e');
    adaInternet = false;
  } on Error catch (e) {
    print('General Error: $e');
    adaInternet = false;
  }
  return adaInternet;
}
