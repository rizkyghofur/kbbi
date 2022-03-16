import 'package:flutter/material.dart';
import 'package:kbbi/models/responses/ArtiDetailResponse.dart';

class Detail extends StatefulWidget {
  final String lema;
  final List<ArtiDetailResponse> arti;
  Detail({this.lema, this.arti, Key key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.lema)),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: widget.arti == null ? 0 : widget.arti.length,
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.arti[index].kelaskata,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.arti[index].deskripsi,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
