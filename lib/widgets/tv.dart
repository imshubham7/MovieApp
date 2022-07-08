import 'package:flutter/material.dart';

import '../description.dart';
import '../utils/text.dart';

class TV extends StatelessWidget {

  final List tv;

  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top TV Shows ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(itemCount: tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: tv[index]['original_name'],
                        bannerurl:'https://image.tmdb.org/t/p/w500'+ tv[index]['backdrop_path'] ,
                        posterurl: 'https://image.tmdb.org/t/p/w500'+ tv[index]['poster_path'],
                        description: tv[index]['overview'],
                        vote: tv[index]['vote_average'].toString(),
                        launch_on: tv[index]['first_air_date'],)));
                    },
                    child: tv[index]['original_name'] !=null ? PreferredSize(
                      preferredSize: const Size.fromHeight(140.0),
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        children: [
                          Container(
                            padding:const EdgeInsets.all(5),
                            width: 180,
                            height: 135,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                              image: NetworkImage(

                                'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path'],
                              ), fit: BoxFit.cover
                            )),
                          ),
                          const SizedBox(height: 10),
                          modified_text(text: tv[index]['original_name'] ?? 'Loading'
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
