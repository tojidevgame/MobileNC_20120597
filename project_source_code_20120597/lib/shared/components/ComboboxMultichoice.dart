import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ComboboxMultichoice extends StatefulWidget {
  final String hint;
  final Function(List<String>) selectedList;
  final List<String> listOfStrings;
  final ValueChanged<List<String>> onSelectionChanged;
  late BoxDecoration decoration = BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(12));

  ComboboxMultichoice(
      {super.key,
      required this.hint,
      required this.selectedList,
      required this.listOfStrings,
      required this.onSelectionChanged, decoration});

  @override
  State<StatefulWidget> createState() => ComboboxMultichoiceState();
}

class ComboboxMultichoiceState extends State<ComboboxMultichoice> {
  List<String> listOfSelectedItem = [];
  String selectedText = "";


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      decoration: widget.decoration,
      child: ExpansionTile(
        iconColor: Colors.grey,
        title: Text(
          listOfSelectedItem.isEmpty ? widget.hint : listOfSelectedItem.join(";"),
        ),
        children: <Widget>[
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.listOfStrings.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                child: _ViewItem(
                    item: widget.listOfStrings[index],
                    selected: (val) {
                      selectedText = val;
                      if (listOfSelectedItem.contains(val)) {
                        listOfSelectedItem.remove(val);
                      } else {
                        listOfSelectedItem.add(val);
                      }
                      widget.selectedList(listOfSelectedItem);
                      widget.onSelectionChanged(listOfSelectedItem);
                      setState(() {});
                    },
                    itemSelected: listOfSelectedItem
                        .contains(widget.listOfStrings[index])),
              );
            },
          ),
        ],
      ),
    );
  }
}


// ignore: must_be_immutable
class _ViewItem extends StatelessWidget {
      String item;
      bool itemSelected;
      final Function(String) selected;
    
      _ViewItem(
          {required this.item, required this.itemSelected, required this.selected});
    
      @override
      Widget build(BuildContext context) {
        var size = MediaQuery.of(context).size;
        return Padding(
          padding:
              EdgeInsets.only(left: size.width * .032, right: size.width * .098),
          child: Row(
            children: [
              SizedBox(
                height: 24.0,
                width: 24.0,
                child: Checkbox(
                  value: itemSelected,
                  onChanged: (val) {
                    selected(item);
                  },
                  activeColor: Colors.blue,
                ),
              ),
              SizedBox(
                width: size.width * .025,
              ),
              Text(
                item,
              ),
            ],
          ),
        );
      }
    }