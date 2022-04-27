import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class apicalling extends StatefulWidget {
  const apicalling({Key? key}) : super(key: key);

  @override
  State<apicalling> createState() => _apicallingState();
}
                                                  // map ni andar map eni andar list hoy tyare
class _apicallingState extends State<apicalling> {
  String fb="";
  String url="";

  viewresponce? ll;
  bool status=false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vivedata();
  }

  Future <void> vivedata() async {

    var url=Uri.parse('https://us-central1-international-stylist-b06a9.cloudfunctions.net/test01/android');
    var responce=await http.get(url);
    print('Response status: ${responce.statusCode}');
    debugPrint('Response body: ${responce.body}');

    var rr=jsonDecode(responce.body);
    ll=viewresponce.fromJson(rr);

    setState(() {
      status=true;
    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                 fb="${ll!.data!.adId!.admobNative}";
                 url="${ll!.data!.moreApp![0].imageurl}";

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
    );
  }


}
class viewresponce {
  bool? status;
  Data? data;

  viewresponce({this.status, this.data});

  viewresponce.fromJson(Map<String, dynamic> json) {
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
  String? facebookBanner;
  String? admobInterstitial;
  String? facebookReward;
  String? admobOpenad;
  String? facebookInterstitial;
  String? admobNative;
  String? adType;
  String? facebookNative;
  String? admobBanner;
  String? admobReward;

  AdId(
      {this.facebookBanner,
        this.admobInterstitial,
        this.facebookReward,
        this.admobOpenad,
        this.facebookInterstitial,
        this.admobNative,
        this.adType,
        this.facebookNative,
        this.admobBanner,
        this.admobReward});

  AdId.fromJson(Map<String, dynamic> json) {
    facebookBanner = json['facebook_banner'];
    admobInterstitial = json['admob_interstitial'];
    facebookReward = json['facebook_reward'];
    admobOpenad = json['admob_openad'];
    facebookInterstitial = json['facebook_interstitial'];
    admobNative = json['admob_native'];
    adType = json['ad_type'];
    facebookNative = json['facebook_native'];
    admobBanner = json['admob_banner'];
    admobReward = json['admob_reward'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook_banner'] = this.facebookBanner;
    data['admob_interstitial'] = this.admobInterstitial;
    data['facebook_reward'] = this.facebookReward;
    data['admob_openad'] = this.admobOpenad;
    data['facebook_interstitial'] = this.facebookInterstitial;
    data['admob_native'] = this.admobNative;
    data['ad_type'] = this.adType;
    data['facebook_native'] = this.facebookNative;
    data['admob_banner'] = this.admobBanner;
    data['admob_reward'] = this.admobReward;
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
  String? appurl;
  String? appname;

  MoreApp({this.active, this.imageurl, this.appurl, this.appname});

  MoreApp.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    imageurl = json['imageurl'];
    appurl = json['appurl'];
    appname = json['appname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['imageurl'] = this.imageurl;
    data['appurl'] = this.appurl;
    data['appname'] = this.appname;
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
