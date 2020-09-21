
import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hsfx/models/slider.dart';
import 'package:hsfx/models/slider_services.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: HomeCustomeView()
    );
  }
}

class HomeCustomeView extends StatefulWidget {
  @override
  _HomeCustomeViewState createState() => _HomeCustomeViewState();
}

class _HomeCustomeViewState extends State<HomeCustomeView> {
  List _listData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  getList() {
    SliderServices.loadSlider().then((value) {
      setState(() {
        _listData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[

        SliverAppBar(
          pinned: true,
          expandedHeight: 44,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('首页', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
            titlePadding: EdgeInsetsDirectional.only(start: 10, bottom: 16),
            centerTitle: false,
          ),
        ),

        SliverToBoxAdapter(
          child: createSwiper(),
        ),

        SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    child: Text('grid item $index'),
                    color: Colors.cyan[100 * (index % 9)],
                    alignment: Alignment.center,
                  );
                },
              childCount: 20
              ,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
        )

      ],
    );
  }

  // 创建swiper
  Widget createSwiper() {
    return Container(
      height: 200,
      child: _listData == null
        ? Center(child: CircularProgressIndicator(),)
        : Swiper(
        itemBuilder: (BuildContext context, int index) {
          HSlider slider = _listData.length > index ? _listData[index] : null;
          return Image.network(slider.thumb, fit: BoxFit.contain);
        },
        itemCount: _listData.length,
        onTap: (int index) {
          HSlider slider = _listData.length > index ? _listData[index] : null;
          String linkUrl = slider.url;
        },
        autoplay: true,
      ),
    );
  }
}
