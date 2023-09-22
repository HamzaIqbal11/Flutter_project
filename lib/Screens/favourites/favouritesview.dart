import 'package:flutter/material.dart';
import 'package:mini_project/Screens/categories/category2/customwidget/data.dart';
import 'package:mini_project/Screens/customwidgets/colors.dart';
import 'package:mini_project/Screens/favourites/favorites.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 155,
            width: double.infinity,
            color: color.themecolor,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      // AppText.favorite,
                      ""),
                  Text(
                    "",
                  )
                ],
              ),
            )),
        Expanded(
          child: favItem.isEmpty
              ? Column(
                  children: [
                    Image.network(
                        'https://i.giphy.com/media/0HhDnlH89djZtRqYoO/giphy.webp'),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'You haven\'t added item to your favorite list',
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  itemCount: favItem.length,
                  itemBuilder: (context, index) {
                    final myFavItem = favItem[index];
                    final listData = data[index];
                    final shops = listData['shops'][index];
                    final shopProducts = shops['product'][index];
                    final detail = shopProducts['detail'][index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(myFavItem['image']),
                      ),
                      title: Text(myFavItem['productname']),
                      subtitle: Text('\$${myFavItem['price']}'),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              favItem.removeAt(index);
                            });
                            detail['isFav'] = false;
                          },
                          icon: Icon(Icons.favorite,
                              color: myFavItem['isFav'] == true
                                  ? color.red
                                  : color.black)),
                    );
                  },
                ),
        )
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:mini_project/Screens/categories/category1/category1.dart';
// import 'package:mini_project/Screens/customwidgets/colors.dart';


// class favourites extends StatefulWidget {
//   const favourites({super.key});

//   @override
//   State<favourites> createState() => _CategoriesViewState();
// }

// class _CategoriesViewState extends State<favourites> {
//   String? selectedCategory;
//   // late Map<String, dynamic> selectedShop;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//               height: 155,
//               width: double.infinity,
//               color: Colors.blue,
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                   left: 20,
//                   right: 20,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                     "go"
//                     ),
//                     Text(
//                     "ho"
//                     )
//                   ],
//                 ),
//               )),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Padding(
//               padding: const EdgeInsets.only(
//                   left: 20, top: 20, right: 12, bottom: 20),
//               child: Row(
//                 children: data
//                     .map((categoryData) => Padding(
//                           padding: const EdgeInsets.only(right: 8),
//                           child: FilterChip(
//                             side: BorderSide(color: color.boxcolor),
//                             showCheckmark: false,
//                             selectedColor: color.boxcolor,
//                             selected:
//                                 selectedCategory == categoryData['category'],
//                             backgroundColor: color.boxcolor,
//                             label: Padding(
//                               padding: const EdgeInsets.all(6.0),
//                               child: Text(
//                                 categoryData['category'],
//                               ),
//                             ),
//                             onSelected: (selected) {
//                               setState(() {
//                                 if (selected) {
//                                   selectedCategory = categoryData['category'];
//                                 } else {
//                                   selectedCategory = null;
//                                 }
//                               });
//                             },
//                           ),
//                         ))
//                     .toList(),
//               ),
//             ),
//           ),
//           if (selectedCategory != null)
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 10),
//                   // Display shops in the selected category
//                   _buildShopList(selectedCategory!),
//                 ],
//               ),
//             )
//         ],
//       ),
//     );
//   }

//   Widget _buildShopList(String category) {
//     final categoryData = data.firstWhere(
//       (categoryData) => categoryData['category'] == category,
//     );

//     final List<Map<String, dynamic>> shops = categoryData['shops'];

//     return ListView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: shops.length,
//       itemBuilder: (context, index) {
//         final shopData = shops[index];
//         return InkWell(
//           onTap: () async {
//             await Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => Category1(),
//               ),
//             );
//             setState(() {});
//           },
//           child: Padding(
//             padding: const EdgeInsets.only(
//               bottom: 30,
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(15)),
//                   height: 165,
//                   width: 135,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Image.asset(
//                       shopData['image'],
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                   child: SizedBox(
//                     height: 145,
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           shopData['shopname'],
                         
//                           softWrap: true,
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Text(shopData['subtitle'],
//                            ),
//                         const Spacer(),
//                         Text(
//                          "hI"
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           shopData['price'],
                          
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

