import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//project full hoi nai ekon oo baki ace
class GridSearchScreen extends StatefulWidget {
  const GridSearchScreen({Key? key}) : super(key: key);

  @override
  _GridSearchScreenState createState() => _GridSearchScreenState();
}

class _GridSearchScreenState extends State<GridSearchScreen> {
  List<String> nameList = [
    'Jisan Jomadder',
    'Jomadder',
    'Nurunnobe Jomadder',
    'Jisan',
    'ER Jebon',
    'F Rabby',
    'Fatema Akter',
    'H M Imam Hossen',
    'Hafijul Islam Kabir',
    'Lincoln Ibrahim',
    'Md Al Amin Mia',
    'Mithun Mandal',
    'Nurunnobe Jomadder Jisan',
    'Phis Khan II',
    'Rasel Hassan',
    'Shahrear Tomal',
    'Zihadul Islam',
    'Tarin Afrin Allpo',
    'Zisan Ahmed',
    'Apurba Kundu',
    'Arafat Khondokar',
    'Aryan Khan',
    'Jahirul Islam Jahir',
    'Labib Ashab',
    'Md Munna Hossain',
    'Md Osman',
    'Musa Hasan Surjo',
    'Niloy Das',
    'Prodip Biswas',
    'Sajeeb Pal',
    'Shohel Shikder',
    'Islam',
    'Zihadul',
  ];
  List<String>? nameListSearch;
  final FocusNode _textFocusNode = FocusNode();
  final TextEditingController? _textEditingController = TextEditingController();
  @override
  void dispose() {
    _textFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.indigoAccent,
            title: Container(
              decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                controller: _textEditingController,
                focusNode: _textFocusNode,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Search here',
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    contentPadding: const EdgeInsets.all(8)),
                onChanged: (value) {
                  setState(() {
                    nameListSearch = nameList
                        .where(
                            (element) => element.contains(value.toLowerCase()))
                        .toList();
                    if (_textEditingController!.text.isNotEmpty &&
                        nameListSearch!.isEmpty) {
                      if (kDebugMode) {
                        print('nameListSearch length ${ nameListSearch!.length }');
                      }
                    }
                  });
                },
              ),
            )),
        body: _textEditingController!.text.isNotEmpty &&
                nameListSearch!.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search_off,
                          size: 160,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'No results found,\nPlease try different keyword',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 12,
                ),
                itemCount: _textEditingController!.text.isNotEmpty
                    ? nameListSearch!.length
                    : nameList.length,
                itemBuilder: (ctx, index) {
                  return Padding(


                    padding: const EdgeInsets.all(8.0),

                    child: Row(
                      children: [
                        const CircleAvatar(

                          child: Icon(Icons.people_alt_outlined,color: Colors.white60,),


                        ),

                        const SizedBox(
                          width: 10,

                        ),
                        Text(_textEditingController!.text.isNotEmpty
                            ? nameListSearch![index]
                            : nameList[index]),
                      ],
                    ),
                  );
                }));
  }
}
