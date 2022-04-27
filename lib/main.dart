import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'gett.dart';

void main() {
  runApp(MaterialApp(
    home: firstpage(),
  ));
}

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  String fb = "";
  String url = "";
  viveresponce? ll;
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewdata();
  }

  Future<void> viewdata() async {
    var url = Uri.parse(
        'https://us-central1-international-stylist-b06a9.cloudfunctions.net/test01/android');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');

    var rr = jsonDecode(response.body);
    ll = viveresponce.fromJson(rr);

    print(ll);

    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return status
        ? Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 200,
                  color: Colors.brown.shade100,
                  child: Text(fb),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 200,
                  color: Colors.brown.shade100,
                  child: Text(url),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 200,
                  color: Colors.brown.shade100,
                  child: Text(""),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      fb = "${ll!.data!.adId!.admobBanner}";
                      url = "${ll!.data!.moreApp![0].imageurl}";
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.green,
                    height: 50,
                    width: 50,
                    child: Text("submit"),
                  ),
                )
              ],
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}

class viveresponce {
  bool? status;
  Data? data;

  viveresponce({this.status, this.data});

  viveresponce.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  AdId? adId;
  Keyword? keyword;
  List<MoreApp>? moreApp;
  List<PlayGame>? playGame;

  Data({this.adId, this.keyword, this.moreApp, this.playGame});

  Data.fromJson(Map<String, dynamic> json) {
    adId = json['ad_id'] != null ? new AdId.fromJson(json['ad_id']) : null;
    keyword =
        json['keyword'] != null ? new Keyword.fromJson(json['keyword']) : null;
    if (json['more_app'] != null) {
      moreApp = <MoreApp>[];
      json['more_app'].forEach((v) {
        moreApp!.add(new MoreApp.fromJson(v));
      });
    }
    if (json['play_game'] != null) {
      playGame = <PlayGame>[];
      json['play_game'].forEach((v) {
        playGame!.add(new PlayGame.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.adId != null) {
      data['ad_id'] = this.adId!.toJson();
    }
    if (this.keyword != null) {
      data['keyword'] = this.keyword!.toJson();
    }
    if (this.moreApp != null) {
      data['more_app'] = this.moreApp!.map((v) => v.toJson()).toList();
    }
    if (this.playGame != null) {
      data['play_game'] = this.playGame!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdId {
  String? admobReward;
  String? admobBanner;
  String? adType;
  String? facebookNative;
  String? facebookInterstitial;
  String? admobOpenad;
  String? facebookBanner;
  String? facebookReward;
  String? admobInterstitial;
  String? admobNative;

  AdId(
      {this.admobReward,
      this.admobBanner,
      this.adType,
      this.facebookNative,
      this.facebookInterstitial,
      this.admobOpenad,
      this.facebookBanner,
      this.facebookReward,
      this.admobInterstitial,
      this.admobNative});

  AdId.fromJson(Map<String, dynamic> json) {
    admobReward = json['admob_reward'];
    admobBanner = json['admob_banner'];
    adType = json['ad_type'];
    facebookNative = json['facebook_native'];
    facebookInterstitial = json['facebook_interstitial'];
    admobOpenad = json['admob_openad'];
    facebookBanner = json['facebook_banner'];
    facebookReward = json['facebook_reward'];
    admobInterstitial = json['admob_interstitial'];
    admobNative = json['admob_native'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admob_reward'] = this.admobReward;
    data['admob_banner'] = this.admobBanner;
    data['ad_type'] = this.adType;
    data['facebook_native'] = this.facebookNative;
    data['facebook_interstitial'] = this.facebookInterstitial;
    data['admob_openad'] = this.admobOpenad;
    data['facebook_banner'] = this.facebookBanner;
    data['facebook_reward'] = this.facebookReward;
    data['admob_interstitial'] = this.admobInterstitial;
    data['admob_native'] = this.admobNative;
    return data;
  }
}

class Keyword {
  String? privacy;
  String? version;

  Keyword({this.privacy, this.version});

  Keyword.fromJson(Map<String, dynamic> json) {
    privacy = json['privacy'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['privacy'] = this.privacy;
    data['version'] = this.version;
    return data;
  }
}

class MoreApp {
  bool? active;
  String? imageurl;
  String? appname;
  String? appurl;

  MoreApp({this.active, this.imageurl, this.appname, this.appurl});

  MoreApp.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    imageurl = json['imageurl'];
    appname = json['appname'];
    appurl = json['appurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['imageurl'] = this.imageurl;
    data['appname'] = this.appname;
    data['appurl'] = this.appurl;
    return data;
  }
}

class PlayGame {
  String? imageurl;
  String? appurl;
  bool? active;

  PlayGame({this.imageurl, this.appurl, this.active});

  PlayGame.fromJson(Map<String, dynamic> json) {
    imageurl = json['imageurl'];
    appurl = json['appurl'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageurl'] = this.imageurl;
    data['appurl'] = this.appurl;
    data['active'] = this.active;
    return data;
  }
}
