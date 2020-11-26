import 'package:card_gallery/Galerry.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchText = "";
  List<Gallery> cardsList = List<Gallery>();
  Gallery gallery = Gallery(
    title: 'aaard Title',
    subtitle: 'Card Subtitle',
    icon: Icons.widgets,
    picUrl: 'assets/images/burger.jpg',
    description:
        'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است.',
    buttonBar: ButtonBar(
      children: [
        FlatButton(
          textColor: const Color(0xFF6200EE),
          onPressed: () {
            // Perform some action
          },
          child: const Text('ACTION 1'),
        ),
        FlatButton(
          textColor: const Color(0xFF6200EE),
          onPressed: () {
            // Perform some action
          },
          child: const Text('ACTION 2'),
        ),
      ],
    ),
  );
  Gallery gallery1 = Gallery(
    title: 'Cardnew',
    subtitle: 'Card Subtitle',
    icon: Icons.widgets,
    picUrl: 'assets/images/burger.jpg',
    description:
        'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است.',
    buttonBar: ButtonBar(
      children: [
        FlatButton(
          textColor: const Color(0xFF6200EE),
          onPressed: () {
            // Perform some action
          },
          child: const Text('ACTION 1'),
        ),
        FlatButton(
          textColor: const Color(0xFF6200EE),
          onPressed: () {
            // Perform some action
          },
          child: const Text('ACTION 2'),
        ),
      ],
    ),
  );

  void Search(String _text) {
    // if (_text.isEmpty) {
    //   selectedBrandsList =
    //       RegisterBusiness().getBrands().map((e) => e).toList();
    // } else {
    cardsList =
        cardsList.where((element) => element.title.contains(_text)).toList();
    // = RegisterBusiness()
    //     .getBrands()
    //     .where((element) =>
    // element.persianName.contains(_text) ||
    //     (element.madeInContry != null &&
    //         element.madeInContry.contains(_text)))
    //     .toList();
    //}

    setState(() {});
  }
  void cardSort(){
    cardsList.where((element) => element.title.sort);
  }

  @override
  Widget build(BuildContext context) {
    cardsList.add(gallery);
    cardsList.add(gallery1);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              //height: 38,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.only(left: 15.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(5.0),
              ),
              //آیکون سرچ
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    margin: EdgeInsets.only(right: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.grey,
                      onChanged: (value) {
                        searchText = value;
                        Search(value);
                      },
                      cursorRadius: Radius.circular(5),
                      //controller: _controller5,
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_downward),
                      onPressed: () {
                        cardsList.sort();
                      }),
                  Icon(
                    Icons.search,
                  ),
                ],
              ),
            ),
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: cardsList
                    .map((e) => Card(
                            child: Column(
                          children: [
                            ListTile(
                              leading: Icon(e.icon),
                              title: Text(e.title),
                              subtitle: Text(
                                e.subtitle,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                            ),
                            Image(image: AssetImage(e.picUrl)),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                e.description,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            e.buttonBar,
                          ],
                        )))
                    .toList(),
                // Card(
                //   child: Column(
                //     children: [
                //       ListTile(
                //         leading: Icon(gallery.icon ?? Icons.widgets),
                //         title: Text(gallery.title  ?? 'Card Title'),
                //         subtitle: Text(
                //           gallery.subtitle ?? 'Card Subtitle',
                //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
                //         ),
                //       ),
                //       Image(
                //         image: AssetImage(gallery.picUrl ?? 'assets/images/burger.jpg'),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(16.0),
                //         child: Text(gallery.picUrl ??
                //           'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است.',
                //           textDirection: TextDirection.rtl,
                //           style: TextStyle(color: Colors.black.withOpacity(0.6) ),
                //         ),
                //       ),
                //       gallery.buttonBar ??
                //       ButtonBar(
                //         children: [
                //           FlatButton(
                //             textColor: const Color(0xFF6200EE),
                //             onPressed: () {
                //               // Perform some action
                //             },
                //             child: const Text('ACTION 1'),
                //           ),
                //           FlatButton(
                //             textColor: const Color(0xFF6200EE),
                //             onPressed: () {
                //               // Perform some action
                //             },
                //             child: const Text('ACTION 2'),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
