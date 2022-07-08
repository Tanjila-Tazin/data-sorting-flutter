import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map> _books = [
    {
      'id': 2012020088,
      'name': 'Roni',
      'marks': 45,
    },
    {
      'id': 2012020053,
      'name': 'Fariha',
      'marks': 56,
    },
    {
      'id': 2012020075,
      'name': 'Showmik',
      'marks': 34,
    },
    {
      'id': 2012020056,
      'name': 'Mithila',
      'marks': 67,
    },
    {
      'id': 2012020090,
      'name': 'Adib',
      'marks': 90,
    },
    {
      'id': 2012020057,
      'name': 'Prithi',
      'marks': 78,
    },
    {
      'id': 2012020055,
      'name': 'Murchona',
      'marks': 23,
    },
    {
      'id': 2012020071,
      'name': 'Nabajuti',
      'marks': 98,
    },
    {
      'id': 2012020081,
      'name': 'Promi',
      'marks': 87,
    },
    {
      'id': 2012020076,
      'name': 'Arif',
      'marks': 90,
    },
    {
      'id': 2012020059,
      'name': 'Jony',
      'marks': 78,
    },
    {
      'id': 2012020060,
      'name': 'Anupoma',
      'marks': 60,
    },
  ];

  int _currentSortColumn = 0;
  bool _isSortAsc = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('DataTable for tutorail'),),
        body: ListView(
          children: [
            _createDataTable()
          ],
        ),
      ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _createRows(),
      sortColumnIndex: _currentSortColumn,
      sortAscending: _isSortAsc,
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
          label: Text('ID'),
          onSort: (columnIndex, bool_variable){
            setState(
                    (){
                  _currentSortColumn = columnIndex;
                  if (_isSortAsc) {
                    _books.sort((a, b) => b['id'].compareTo(a['id']));
                  } else {
                    _books.sort((a, b) => a['id'].compareTo(b['id']));
                  }
                  _isSortAsc = !_isSortAsc;
                }
            );
          }
      ),
      DataColumn(
    label: Text('Marks'),
    onSort: (columnIndex, bool_variable){
    setState(
    (){
    _currentSortColumn = columnIndex;
    if (_isSortAsc) {
    _books.sort((a, b) => b['marks'].compareTo(a['marks']));
    } else {
    _books.sort((a, b) => a['marks'].compareTo(b['marks']));
    }
    _isSortAsc = !_isSortAsc;
    }
    );
    }
    ),

      DataColumn(label: Text('Name')),

    ];
  }

  List<DataRow> _createRows() {
    return _books
        .map((book) => DataRow(cells: [
      DataCell(Text('#' + book['id'].toString())),
      DataCell(Text(book['marks'].toString())),
      DataCell(Text(book['name'])),
    ]))
        .toList();
  }
}