import 'package:flutter/material.dart';

import '../description.dart';
import '../utils/text.dart';

class TrendingMovies extends StatelessWidget {

  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trending Movies and TV Shows ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          SizedBox(
            height: 260,
            child: ListView.builder(itemCount: trending.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){

              return InkWell(
                onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: trending[index]['title'],
bannerurl:'https://image.tmdb.org/t/p/w500'+ trending[index]['backdrop_path'] ,
posterurl: 'https://image.tmdb.org/t/p/w500'+ trending[index]['poster_path'],
description: trending[index]['overview'],
vote: trending[index]['vote_average'].toString(),
launch_on: trending[index]['release_date'],)));
                },
               child:
               trending[index]['title'] !=null ? PreferredSize(
                preferredSize: const Size.fromHeight(140.0),
                child: SizedBox(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height: 168,
                        decoration: BoxDecoration(image: DecorationImage(
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                          ),
                        )),
                      ),
                    modified_text(text: trending[index]['title'] ?? 'Loading'
                     ),
                    ],
                  ),
                ),
               ): Container(),
              );
            }),
          ),
        ],
      ),
    );
  }
}
