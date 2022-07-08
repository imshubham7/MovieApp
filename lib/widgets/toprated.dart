import 'package:flutter/material.dart';

import '../description.dart';
import '../utils/text.dart';

class TopRated extends StatelessWidget {

  final List toprated;

  const TopRated({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Text(
        'Top Rated Movies ',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
        ),
      ),
          SizedBox(
            height: 270,
            child: ListView.builder(itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: toprated[index]['title'],
                        bannerurl:'https://image.tmdb.org/t/p/w500'+ toprated[index]['backdrop_path'] ,
                        posterurl: 'https://image.tmdb.org/t/p/w500'+ toprated[index]['poster_path'],
                        description: toprated[index]['overview'],
                        vote: toprated[index]['vote_average'].toString(),
                        launch_on: toprated[index]['release_date'],)));
                    },
                    child: SizedBox(
                      height: 270,
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'],
                              ),
                            )),
                          ),

                          modified_text(text: toprated[index]['title'] ?? 'Loading'),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
