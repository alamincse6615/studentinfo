import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//project full hoi nai ekon oo baki ace
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> nameList = [
    'Jisan Jomadder',
    'Jomadder',
    'Nurunnobe ',
    'Jisan',
    'ER Jebon',
    'F Rabby',
    'Fatema Akter',
    'H M Imam Hossen',
    'Hafijul Islam Kabir',
    'Lincoln Ibrahim',
    'Md Al Amin Mia',
    'Mithun Mandal',
    'Nurunnobe  Jisan',
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
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _textEditingController,
                focusNode: _textFocusNode,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Search here',
                    contentPadding: EdgeInsets.all(8)),
                onChanged: (value) {
                  setState(() {
                    nameListSearch = nameList
                        .where(
                            (element) => element.contains(value.toLowerCase()))
                        .toList();
                    if (_textEditingController!.text.isNotEmpty &&
                        nameListSearch!.isEmpty) {
                      if (kDebugMode) {
                        print('nameListSearch length ${nameListSearch!.length}');
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
                          Icons.search_off,color: Colors.indigoAccent,
                          size: 160,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'No results found,\nPlease try other keyword',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: _textEditingController!.text.isNotEmpty
                    ? nameListSearch!.length
                    : nameList.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          child: Icon(Icons.people_alt_outlined),
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
