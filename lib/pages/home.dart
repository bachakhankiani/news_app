import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/article_view.dart';
import 'package:news_app/pages/category_tile.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/services/slider_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/category_model.dart';
import '../models/slider_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true;
  int activeIndex = 0;

  @override
  void initState() {
    categories = getCategories();
    sliders = getSliders();
    getNews();
    super.initState();
  }
  getNews()async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
  _loading = false;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Container(
          margin: EdgeInsets.only(left: 10,right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/logo.png',height: 60,width: 60,),
              SizedBox(width: 20,),
              Text('World'),
              Text('News',style: TextStyle(color: Colors.blue),)

            ]
          ),
        ),
      ),
      body: _loading? Center(child: CircularProgressIndicator()):SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categories.length,
                    itemBuilder: (context , index){
                    return CategoryTile(
                      image: categories[index].image,
                      categoryName: categories[index].categoryName,

                    );

                }),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Breaking New!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),),
                    Text('View All',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blue),),

                  ],
                ),
              ),
              SizedBox(height: 5,),
              CarouselSlider.builder(
                  itemCount: sliders.length,
                  itemBuilder: (context , index,realIndex){
                    String? res = sliders[index].image;
                    String? res1 = sliders[index].name;
                    return buildImage(res!, index, res1!);
                  },
                  options: CarouselOptions(
                      height: 250,
                      //viewportFraction: 1,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (index,reason){
                        setState(() {
                          activeIndex = index;
                        });
                    }
                  )),
              SizedBox(height: 10,),
              Center(child: buildIndicator()),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Trending New!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),),
                    Text('View All',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blue),),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: articles.length,
                    itemBuilder: (context,index){
                  return BlogTile(
                      imageUrl: articles[index].urltoImage!,
                      title: articles[index].title!,
                      desc: articles[index].description!);
                }),
              )



              
            ],
          ),
        ),
      ),
    );
  }
  Widget buildImage(String image, int index, String name)=> Container(
    margin: EdgeInsets.symmetric(horizontal: 5.0),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image, fit: BoxFit.cover,width: MediaQuery.of(context).size.width,)),
        Container(
          height: 100,
          margin: EdgeInsets.only(top: 130),
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Text(name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
        )
      ],
    ),
  );

  Widget buildIndicator()=>AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: sliders.length,
      effect: SlideEffect(dotHeight: 12,dotWidth: 12,activeDotColor: Colors.blue),
  );
}
class BlogTile extends StatelessWidget {
  String imageUrl, title ,desc,url;
  BlogTile({ required this.imageUrl, required this.title, required this.desc, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(blogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Material(
          elevation: 3.0,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,

                      )
                    ]
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),

                      child:CachedNetworkImage(
                        imageUrl: imageUrl,
                        height: 120,width: 120,fit: BoxFit.cover,)),
                ),
                SizedBox(width: 5,),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(20)
                      ),
                        width: MediaQuery.of(context).size.width/2.1,
                        child: Text(title!,
                          maxLines: 2,
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),)),

                    Container(
                        width: MediaQuery.of(context).size.width/2.1,
                        child: Text(desc!,
                          maxLines: 3,
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
