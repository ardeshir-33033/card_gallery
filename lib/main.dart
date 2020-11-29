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
  List<Gallery> cardsList1;
  List<Gallery> cardsList = [
    Gallery(
      title: 'Aaard Title',
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
    ),
    Gallery(
      title: 'Baard Title',
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
    ),
    Gallery(
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
    )
  ];

  void Search(String _text) {
    if(_text != null){
      cardsList = cardsList1;
    }
    cardsList =
        cardsList.where((element) => element.title.contains(_text)).toList();

    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    cardsList1 = cardsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
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
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.arrow_downward),
                        onPressed: () {
                          cardsList.sort((a, b) => a.title.compareTo(b.title));
                          setState(() {});
                        }),
                    Icon(
                      Icons.search,
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  shrinkWrap: true,
                  children: cardsList
                      .map((e) => Card(
                              child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5.0),
                                      topLeft: Radius.circular(5.0)),
                                  child: Image(
                                      image: AssetImage(e.picUrl),
                                      fit: BoxFit.cover,
                                      height: 200,
                                      width:
                                          MediaQuery.of(context).size.width)),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
