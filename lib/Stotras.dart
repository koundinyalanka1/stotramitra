import 'package:flutter/material.dart';

class Stotras extends StatelessWidget {
  const Stotras({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var image_array = ['assets/images/vishnu.jpg','assets/images/shiva.jpg','assets/images/lalita_devi.jpg','assets/images/lakshmi_devi.jpg','assets/images/saraswati_devi.jpg','assets/images/gayatri_devi.jpg','assets/images/surya_deva.jpg','assets/images/navagrahas.jpg','assets/images/hanuman.jpg','assets/images/ganesha.jpg','assets/images/karthikeya.jpg','assets/images/sai_baba.jpg','assets/images/dattatreya.jpg','assets/images/adishankaracharya.jpg'];

    return Scaffold(
      body: Center(
        child: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: 12,
          itemBuilder: (ctx, i) {
            return Card(
              child: Container(
                //height: ,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            image_array[i],
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          'Title',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Subtitle',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 5,
            mainAxisExtent: 264,
          ),
        ),
      ),
    );
  }
}
