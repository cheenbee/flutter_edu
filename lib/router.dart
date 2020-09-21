

import 'package:flutter/material.dart';
import 'package:hsfx/pages/home.dart';

class Router {
  static const homePage = 'app://';
  static const courseDetailPage = 'app://CourseDetailPage';
  static const searchPage = 'app://SearchPage';
  static const personDetailPage = 'app://PersonDetailPage';


  Widget _getPage(String url, dynamic params) {
    if (url.startsWith('https://') || url.startsWith('http://')) {

    } else {
      switch (url) {
        case homePage:
          return HomePage();
      }
    }
    return null;
  }

  Router.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return _getPage(url, null);
    }));
  }

  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return _getPage(url, params);
    }));
  }

}

