import 'package:demo29/screens/application/modal/applicationModal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ApplicationProvider extends ChangeNotifier {
  String? link;

  //social Media
  List socialLink = [
    'https://www.facebook.com/',
    "https://www.instagram.com/",
    'https://in.linkedin.com/',
    'https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoiZW4ifQ%3D%3D%22%7D'
  ];

  List<SocialModal> applicationData = [
    SocialModal(image: 'assets/images/facebook.png', name: 'Facebook'),
    SocialModal(image: 'assets/images/instagram.png', name: 'Instagram'),
    SocialModal(image: 'assets/images/linkedin.png', name: 'Linkdin'),
    SocialModal(image: 'assets/images/twitter.png', name: 'Twitter'),
  ];

  void appChangeLink(int index) {
    link = socialLink[index];
    notifyListeners();
  }

  //music

  List musicLink = [
    'https://gaana.com/',
    "https://open.spotify.com/",
    'https://www.jiosaavn.com/',
    'https://www.hungama.com/music/'
  ];

  List<MusicModal> musicData = [
    MusicModal(image: 'assets/images/gaana.png', name: 'Gaana'),
    MusicModal(image: 'assets/images/spotify.png', name: 'Spotify'),
    MusicModal(image: 'assets/images/jiosaavn.png', name: 'Jiosaavn'),
    MusicModal(image: 'assets/images/hungama.png', name: 'Hungama'),
  ];

  void musicChnageLink(int index) {
    link = musicLink[index];
    notifyListeners();
  }

  //news

  List newsLink = [
    'https://timesofindia.indiatimes.com/?from=mdr',
    "https://epaper.thehindu.com/login?utm_source=google&utm_medium=cpc&utm_campaign=THEP-Smart-Campaign&tpcc=THEPGS&gclid=Cj0KCQiA8aOeBhCWARIsANRFrQGgyoNlRr9eMfHg3ANRQL_xWZ0hUopFUvPDBASze5myOVaMRgPRngoaAg8hEALw_wcB",
    'https://www.hindustantimes.com/',
    'https://www.nationalheraldindia.com/?gclid=Cj0KCQiA8aOeBhCWARIsANRFrQEfk9el1VCsT1KkMIWO6p3mkqyHOf2P2pMRnKisqkyt2aFmqe6OAFkaAk20EALw_wcB',
    "https://www.morungexpress.com/"
  ];

  List<NewsModal> newsData = [
    NewsModal(image: 'assets/images/toi.png', name: 'Times of India'),
    NewsModal(image: 'assets/images/the_hindu.jpg', name: 'The Hindu'),
    NewsModal(image: 'assets/images/hindustan.png', name: 'Hindustan'),
    NewsModal(image: 'assets/images/national.jpg', name: 'National india'),
    NewsModal(image: 'assets/images/morung.png', name: 'Morungexpress'),
  ];

  void newsChnageLink(int index) {
    link = newsLink[index];
    notifyListeners();
  }

  // ott and online tv
  List onlineLink = [
    'https://www.jiocinema.com/',
    "https://www.jiotv.com/",
    'https://www.primevideo.com/?ref_=dvm_pds_gen_in_as_s_gm_sm1_mkw_symCJqBmk-dc&mrntrk=pcrid_610141119783_slid_Z79Og2ub_pgrid_84577172528_pgeo_9062196_x__adext_23833119429_ptid_kwd-339065342343&gclid=Cj0KCQiA8aOeBhCWARIsANRFrQEAkWhsDQT0H3shMdVQ4IoFQ1BGEKbCRwQDMmjtrZzikUlLKa2Ro7saArEREALw_wcB',
    'https://www.hotstar.com/in',
    "https://www.netflix.com/in/"
  ];

  List<OnlineModal> onlineData = [
    OnlineModal(image: 'assets/images/jiocanema.png', name: 'Jiocanema'),
    OnlineModal(image: 'assets/images/jiotv.png', name: 'Jio tv'),
    OnlineModal(image: 'assets/images/prime.jpg', name: 'Prime video'),
    OnlineModal(image: 'assets/images/hotstar.png', name: 'Hotstar'),
    OnlineModal(image: 'assets/images/netflix.png', name: 'Netflix'),
  ];

  void onlineChnageLink(int index) {
    link = onlineLink[index];
    notifyListeners();
  }

  String searchData = 'https://www.google.com/';
  TextEditingController txtSearch = TextEditingController();
  InAppWebViewController? inAppWebViewController;
  double progress = 0.0;
}
