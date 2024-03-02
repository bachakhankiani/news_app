import 'package:news_app/models/slider_model.dart';

import '../models/category_model.dart';

List<SliderModel> getSliders(){

  List<SliderModel> slider = [];
  SliderModel categoryModel = new SliderModel();

  categoryModel.image = 'images/Business.jpg';
  categoryModel.name = 'How To The Authority of Silence Force';
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  categoryModel.image = 'images/entertainment.jpg';
  categoryModel.name = 'How To The Authority of Silence Force';
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  categoryModel.image = 'images/general.png';
  categoryModel.name = 'How To The Authority of Silence Force';
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  categoryModel.image = 'images/health.jpg';
  categoryModel.name = 'How To The Authority of Silence Force';
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  categoryModel.image = 'images/sport.jpg';
  categoryModel.name = 'How To The Authority of Silence Force';
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  return slider;


}