import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final image;
  final categoryName;
  const CategoryTile({super.key, this.image, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Stack(
        children: [
         ClipRRect(
           borderRadius: BorderRadius.circular(7),
           child: Image.asset(
             image,
             height:60,
             width: 120,
             fit: BoxFit.cover,
           ),
         ),
          Container(
            height:60,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.black38,
              borderRadius: BorderRadius.circular(7)
            ),

            child: Center(child: Text(categoryName, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
          )
        ],
      ),
    );
  }
}
