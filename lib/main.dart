//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  © Cosmos Software | Ali Yigit Bireroglu                                                                                                          /
//  All material used in the making of this code, project, program, application, software et cetera (the "Intellectual Property")                    /
//  belongs completely and solely to Ali Yigit Bireroglu. This includes but is not limited to the source code, the multimedia and                    /
//  other asset files.                                                                                                                               /
//  If you were granted this Intellectual Property for personal use, you are obligated to include this copyright text at all times.                  /
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:spring_button/spring_button.dart';
import 'package:cupertino_stackview/cupertino_stackview.dart';

GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();

List<PageInfo> pageInfos = [
  PageInfo(
    "My biodata",
    "Hello everyone!",
    "Izinkan saya untuk memperkenalkan diri saya, perkenalkan nama saya Muhamad Hadi Saputra, anda bisa memanggil saya Hadi. Saya kelahiran tahun 2001. Umur saya sekarang memasuki 21 tahun, saya anak ke 2 dari 2 bersaudara. ",
  ),
  PageInfo(
    "Alamat",
    "Lokasi tempat saya tinggal",
    "Saya tinggal di Jl. Residen H.Najamuddin Perumahan Kenten Sejahtera 1 Lorong Anggrek 8, Blok N Nomor 10. Kelurahan Kenten Laut,Kecamatan Talang Kelapa, Kabupaten Bayuasin, Provinsi Sumatera Selatan",
  ),
  PageInfo(
    "Riwayat Pendidikan",
    "",
    "Pendidikan terakhir saya yaitu SMA Negeri 14 Palembang, saya lulus pada tahun 2019. Kemudian di tahun 2020 saya melanjutkan studi saya  di perguruan tinggi Institut Teknologi dan Bisnis Palcomtech dengan program studi Strata-1 Jurusan Sistem Informasi. Sekarang saya sedang menempuh di semester 5",
  ),
  PageInfo(
    "Hobi",
    "Bermain Game ",
    "Hobi saya yaitu bermain game dengan genre sepak bola ",
  ),
];

void main() {
  cupertinoStackViewController = CupertinoStackViewController(
    navigatorState,
    {
      "My biodata": (BuildContext context, dynamic parameters) {
        return MyPage(
          0,
        );
      },
      "Alamat": (BuildContext context, dynamic parameters) {
        return MyPage(
          1,
        );
      },
      "Riwayat Pendidikan": (BuildContext context, dynamic parameters) {
        return MyPage(
          2,
        );
      },
      "Hobi": (BuildContext context, dynamic parameters) {
        return MyPage(
          3,
        );
      },
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Biodata Hadi',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyPage(0),
      navigatorKey: navigatorState,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyPage extends StatefulWidget {
  final int index;

  MyPage(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    cupertinoStackViewController.initialise(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
    return CupertinoStackView(
      widget.index == 0,
      pageInfos[widget.index].navigation,
      Scaffold(
        backgroundColor: const Color(0xFFF2F2F7),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF9F9F9),
          leading: widget.index == 0
              ? null
              : SpringButton(
                  SpringButtonType.OnlyScale,
                  Icon(
                    Icons.chevron_left,
                    color: Colors.blueAccent,
                  ),
                  useCache: true,
                  onTapUp: (_) {
                    cupertinoStackViewController.back();
                  },
                ),
          title: Text(
            pageInfos[widget.index].navigation,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyPadding(
                Stack(
                  children: [
                    Container(
                      constraints: BoxConstraints.expand(height: 200),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(const Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 50.0,
                            spreadRadius: 2.5,
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(const Radius.circular(20)),
                      child: Container(
                        constraints: BoxConstraints.expand(height: 600),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/" + widget.index.toString() + ".jpeg",
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.75),
                              blurRadius: 100.0,
                              spreadRadius: 5.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MyPadding(
                RichText(
                  text: TextSpan(
                    text: pageInfos[widget.index].title + "\n\n",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: pageInfos[widget.index].text,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              if (widget.index != pageInfos.length - 1)
                Align(
                  alignment: Alignment(0.0, 0.5),
                  child: MyPadding(
                    SpringButton(
                      SpringButtonType.OnlyScale,
                      Container(
                        height: 60,
                        width: 175,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 4, 125, 185),
                          borderRadius: const BorderRadius.all(const Radius.circular(20)),
                        ),
                        child: Center(
                          child: Text(
                            "Lanjut",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      useCache: true,
                      onTapUp: (_) {
                        cupertinoStackViewController.navigate(pageInfos[widget.index + 1].navigation, context, null);
                      },
                    ),
                  ),
                ),
              if (widget.index == pageInfos.length - 1)
                Align(
                  alignment: Alignment(0.0, 0.5),
                  child: MyPadding(
                    SpringButton(
                      SpringButtonType.OnlyScale,
                      Container(
                        height: 60,
                        width: 175,
                        decoration: const BoxDecoration(
                          color: const Color(0xFF1B1D1E),
                          borderRadius: const BorderRadius.all(const Radius.circular(20)),
                        ),
                        child: Center(
                          child: Text(
                            "Go to Home Page",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      useCache: true,
                      onTapUp: (_) {
                        cupertinoStackViewController.navigate(pageInfos[0].navigation, context, null);
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      Colors.black,
      isDismissible: widget.index != pageInfos.length - 1,
    );
  }
}

class PageInfo {
  final String navigation;
  final String title;
  final String text;

  PageInfo(
    this.navigation,
    this.title,
    this.text,
  );
}

class MyPadding extends StatelessWidget {
  final Widget _child;

  const MyPadding(
    this._child, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: _child,
    );
  }
}
