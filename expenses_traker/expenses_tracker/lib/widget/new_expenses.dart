import "package:flutter/material.dart";
import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/rendering.dart';

class NewExpense extends StatefulWidget {
  const NewExpense(this.addEx, {super.key});
  final void Function(Expense) addEx;
  @override
  State<NewExpense> createState() => _NewExpense();
}

class _NewExpense extends State<NewExpense> {
  final _titleControlar = TextEditingController();
  final _amountControler = TextEditingController();
  DateTime? _dateControalr;
  Category _categoryValue = Category.food;

  @override
  void dispose() {
    _titleControlar.dispose();
    _amountControler.dispose();
    super.dispose();
  }

  void subForm() {
    final enteredAmount = double.tryParse(_amountControler.text);
    final amountIsInValid = enteredAmount == null || enteredAmount <= 0;
    if (_titleControlar.text.trim().isEmpty ||
        amountIsInValid ||
        _dateControalr == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Invalid Input"),
                content: const Text(
                    "Pleas make you sure a valid title , amount , date and category was entered"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("close"))
                ],
              ));
      return;
    } else {
      // ignore: unnecessary_new
      Expense ex = new Expense(
        amount: enteredAmount,
        title: _titleControlar.text,
        date: _dateControalr!,
        category: _categoryValue,
      );
      widget.addEx(ex);
      Navigator.pop(context);
    }
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final first = DateTime(now.year - 1, now.month - 1);
    final last = DateTime(now.year + 1, now.month - 1);

    var date = await showDatePicker(
        context: context, initialDate: now, firstDate: first, lastDate: last);
    setState(() {
      _dateControalr = date;
    });
  }

  void cancleDialog() {
    Navigator.pop(context);
  }

  @override
  Widget build(context) {
    final but = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, Constraints) {
      final width = Constraints.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, but + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          
                          maxLength: 50,
                          controller: _titleControlar,
                          decoration:
                              const InputDecoration(label: Text("Title")),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          maxLength: 20,
                          decoration: const InputDecoration(
                              label: Text("amount"), prefixText: '\$ '),
                          controller: _amountControler,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    maxLength: 50,
                    controller: _titleControlar,
                    decoration: const InputDecoration(label: Text("Title")),
                  ),
                if (width >= 600)
                  Row(
                    children: [
                         DropdownButton(
                            value: _categoryValue,
                            items: Category.values
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name.toUpperCase()),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              } else {
                                setState(() {
                                  _categoryValue = value;
                                });
                              }
                            }
                      ),
                     const Spacer(),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_dateControalr == null
                              ? 'NO Selected Date'
                              : formtDate.format(_dateControalr!)),
                          IconButton(
                            onPressed: _presentDatePicker,
                            icon: const Icon(Icons.calendar_month),
                          )
                        ],
                      ))
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          maxLength: 20,
                          decoration: const InputDecoration(
                              label: Text("amount"), prefixText: '\$ '),
                          controller: _amountControler,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_dateControalr == null
                              ? 'NO Selected Date'
                              : formtDate.format(_dateControalr!)),
                          IconButton(
                            onPressed: _presentDatePicker,
                            icon: const Icon(Icons.calendar_month),
                          )
                        ],
                      ))
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                if(width>=600)
                 Row(children: [TextButton(
                        onPressed: cancleDialog, child: const Text("Cancel")),
                    ElevatedButton(
                      onPressed: subForm,
                      child: const Text("Add Expense "),
                    ),],)
                else
                Row(
                  children: [
                    DropdownButton(
                        value: _categoryValue,
                        items: Category.values
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name.toUpperCase()),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          } else {
                            setState(() {
                              _categoryValue = value;
                            });
                          }
                        }),
                    const Spacer(),
                    TextButton(
                        onPressed: cancleDialog, child: const Text("Cancel")),
                    ElevatedButton(
                      onPressed: subForm,
                      child: const Text("Add Expense "),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
