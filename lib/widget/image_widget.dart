import 'dart:math';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({Key key}) : super(key: key);

  @override
  createState() => ImageWidgetState();
}

const List<String> _countries = [
  'ad',
  'ae',
  'af',
  'ag',
  'ai',
  'al',
  'am',
  'an',
  'ao',
  'aq',
  'ar',
  'as',
  'at',
  'au',
  'aw',
  'ax',
  'az',
  'ba',
  'bb',
  'bd',
  'be',
  'bf',
  'bg',
  'bh',
  'bi',
  'bj',
  'bl',
  'bm',
  'bn',
  'bo',
  'bq',
  'br',
  'bs',
  'bt',
  'bv',
  'bw',
  'by',
  'bz',
  'ca',
  'cc',
  'cd',
  'cf',
  'cg',
  'ch',
  'ci',
  'ck',
  'cl',
  'cm',
  'cn',
  'co',
  'cr',
  'cu',
  'cv',
  'cw',
  'cx',
  'cy',
  'cz',
  'de',
  'dj',
  'dk',
  'dm',
  'do',
  'dz',
  'ec',
  'ee',
  'eg',
  'eh',
  'er',
  'es',
  'et',
  'eu',
  'fi',
  'fj',
  'fk',
  'fm',
  'fo',
  'fr',
  'ga',
  'gb-eng',
  'gb-nir',
  'gb-sct',
  'gb-wls',
  'gb',
  'gd',
  'ge',
  'gf',
  'gg',
  'gh',
  'gi',
  'gl',
  'gm',
  'gn',
  'gp',
  'gq',
  'gr',
  'gs',
  'gt',
  'gu',
  'gw',
  'gy',
  'hk',
  'hm',
  'hn',
  'ht',
  'hu',
  'id',
  'ie',
  'il',
  'im',
  'in',
  'io',
  'iq',
  'ir',
  'is',
  'it',
  'je',
  'jm',
  'jo',
  'jp',
  'ke',
  'kg',
  'kh',
  'ki',
  'km',
  'kn',
  'kp',
  'kr',
  'kw',
  'ky',
  'kz',
  'la',
  'lb',
  'lc',
  'li',
  'lk',
  'lr',
  'ls',
  'lt',
  'lu',
  'lv',
  'ly',
  'ma',
  'mc',
  'md',
  'me',
  'mf',
  'mg',
  'mh',
  'mk',
  'ml',
  'mm',
  'mn',
  'mo',
  'mp',
  'mq',
  'mr',
  'ms',
  'mt',
  'mu',
  'mv',
  'mw',
  'mx',
  'my',
  'mz',
  'na',
  'nc',
  'ne',
  'nf',
  'ng',
  'ni',
  'nl',
  'no',
  'np',
  'nr',
  'nu',
  'nz',
  'om',
  'pa',
  'pe',
  'pf',
  'pg',
  'ph',
  'pk',
  'pl',
  'pm',
  'pn',
  'pr',
  'ps',
  'pt',
  'pw',
  'py',
  'qa',
  're',
  'ro',
  'rs',
  'ru',
  'rw',
  'sa',
  'sb',
  'sc',
  'sd',
  'se',
  'sg',
  'sh',
  'si',
  'sj',
  'sk',
  'sl',
  'sm',
  'sn',
  'so',
  'sr',
  'ss',
  'st',
  'sv',
  'sx',
  'sy',
  'sz',
  'tc',
  'td',
  'tf',
  'tg',
  'th',
  'tj',
  'tk',
  'tl',
  'tm',
  'tn',
  'to',
  'tr',
  'tt',
  'tv',
  'tw',
  'tz',
  'ua',
  'ug',
  'um',
  'us',
  'uy',
  'uz',
  'va',
  'vc',
  've',
  'vg',
  'vi',
  'vn',
  'vu',
  'wf',
  'ws',
  'xk',
  'ye',
  'yt',
  'za',
  'zm',
  'zw'
];

class ImageWidgetState extends State<ImageWidget> {
  int index = 48;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Image")),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(children: <Widget>[
            const Text('??????????????????FadeInImage'),
            const Divider(),

            /// ???????????????????????????Android????????????????????????????????????????????????????????????????????????????????????????????????????????? FadeInImage ????????????
            Row(children: <Widget>[
              FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150),
              FadeInImage.assetNetwork(
                  placeholder: 'images/flutter_logo.png',
                  image: 'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
                  fit: BoxFit.fill,
                  height: 150,
                  width: 150)
            ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
            const Divider(),
            const Text('????????????'),
            const Divider(),

            /// ?????????????????????
            Row(children: <Widget>[
              /// ?????????????????????????????????
              ClipRRect(

                  /// ??????
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      fit: BoxFit.fill, height: 150, width: 150)),

              /// ?????????????????????????????????
              Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: NetworkImage("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                          fit: BoxFit.cover)))
            ], mainAxisAlignment: MainAxisAlignment.spaceBetween),

            const Divider(),
            const Text('????????????'),
            const Divider(),

            /// ?????????????????????
            Row(children: <Widget>[
              ClipOval(
                  child: Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      fit: BoxFit.fill, height: 150, width: 150)),
              const CircleAvatar(
                  backgroundImage: NetworkImage("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                  radius: 75.0)
            ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
            const Divider(),

            const Text('GIF??????'),
            const Divider(),

            /// ??????????????????gif??????
            Image.asset('images/timg.gif', height: 200, width: 200),

            const Divider(),
            const Text('asset????????????'),

            const Divider(),

            Image.asset('images/flutter_logo.png',
                width: 130, //????????????
                height: 130, //????????????
                /// ?????????????????????fill?????????????????????
                fit: BoxFit.scaleDown),

            const Divider(),
            Image.asset('images/flutter_logo.png',
                width: 50,
                height: 50,

                /// ?????????????????????????????????????????????
                repeat: ImageRepeat.repeat),
            const Divider(),
            const Image(image: AssetImage("images/flutter_logo.png"), height: 200, width: 200),
            const Divider(),

            const Text('??????????????????'),
            const Divider(),

            Row(children: <Widget>[
              Image.asset('images/flutter_logo.png',
                  width: 100,

                  /// ?????????????????????colorBlendMode????????????
                  color: Colors.red,

                  /// ???????????????????????????????????????????????????????????????????????????????????????
                  colorBlendMode: BlendMode.overlay),
              Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  width: 100, colorBlendMode: BlendMode.colorDodge, color: Colors.blue)
            ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
            const Divider(),

            /// ??????????????????
            const Text('network????????????'),
            const Divider(),
            Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4", height: 200, width: 200),
            const Divider(),

            /// ??????????????????
            GestureDetector(
              onTap: () {
                setState(() {
                  index = Random().nextInt(_countries.length - 1);
                });
              },
              child: Image(
                  image: NetworkImage(
                      "https://github.com/hjnilsson/country-flags/blob/master/png1000px/${_countries[index]}.png?raw=true")),
            ),

            const Divider(),
            const Text('centerSlice??????????????????'),
            const Divider(),
            Image.asset('images/flutter_logo.png',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
                centerSlice: Rect.fromCircle(center: const Offset(20, 20), radius: 1)),

            const Divider(),
            const Text('matchTextDirection??????????????????'),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
              Directionality(
                  textDirection: TextDirection.ltr,
                  child: Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      height: 150, matchTextDirection: true, fit: BoxFit.cover)),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      height: 150, matchTextDirection: true, fit: BoxFit.cover))
            ]),
            const Divider()
          ]),
        ));
  }
}
