// import 'package:hive_flutter/hive_flutter.dart';

// import 'main_page.dart';
// import 'package:flutter/material.dart';

// class PoemData {
//   List<Poem> poems = [];
  

//   final _box = Hive.box('mybox');
//   final _favBox = Hive.box('favbox');
//   void createInitialFav() {
//     favoritePoems = [
//       Poem(title: 'Poem 1', author: 'Author 1', content: 'Content 1'),
//     ];
//   }

//   void createInitialPeomData() {
    
//   }

//   void loadPoem() {
//     var poemsFromBox = _box.get("POEM");

//     if (poemsFromBox != null && poemsFromBox is List<Poem>) {
//       poems = poemsFromBox;
//     } else {
//       poems = [];
//     }
//   }

//   void loadFav() {
//     favoritePoems = _favBox.get("FAV");
//   }

//   void updatePoemData() {
//     _box.put("POEM", poems);
//   }

//   void updateFavorite() {
//     _favBox.put("FAV", favoritePoems);
//   }
// }
