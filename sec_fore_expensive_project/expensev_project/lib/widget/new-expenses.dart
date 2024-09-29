import "package:expensev_project/model/expesees-data.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

class NewExpenses extends StatefulWidget {
  const NewExpenses(this.onAddExpenses, {super.key});
  final void Function(ExpensesDate) onAddExpenses;
  @override
  State<NewExpenses> createState() {
    return _NewExpenses();
  }
}

class _NewExpenses extends State<NewExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Catagory _slectedCatogry = Catagory.lisure;
  DateTime? dated;
  void _showDate() async {
    final now = DateTime.now();
    final first = DateTime(now.year - 1, now.month, now.day);
    final dateInput = await showDatePicker(
        context: context, initialDate: now, firstDate: first, lastDate: now);
    setState(() {
      dated = dateInput;
    });
  }

  final fooramt = DateFormat.yMd();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: const InputDecoration(label: Text("Title")),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text("Amount"), prefix: Text("\$  ")),
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(dated == null
                    ? "no slected date "
                    : fooramt.format(dated!)),
                IconButton(
                    onPressed: _showDate,
                    icon: const Icon(Icons.calendar_month))
              ],
            ))
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            DropdownButton(
                value: _slectedCatogry,
                items: Catagory.values
                    .map((e) => DropdownMenuItem(
                        value: e, child: Text(e.name.toUpperCase())))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _slectedCatogry = value;
                  });
                }),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("cancel")),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  final isNum = double.tryParse(_amountController.text);
                  final amountIsValid = isNum == null || isNum <= 0;
                  if (_titleController.text.trim().isEmpty ||
                      amountIsValid ||
                      dated == null) {
                    showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                              title: const Text("Invalid Input"),
                              content: const Text(
                                  "pleas sure a valid title ,amount,date and date was entered !"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Okay"))
                              ],
                            )));
                    return;
                  }
                  widget.onAddExpenses(ExpensesDate(
                      amount: isNum,
                      title: _titleController.text,
                      date: dated!,
                      catagory: _slectedCatogry));
                  Navigator.pop(context);
                },
                child: const Text("save expenses"))
          ],
        )
      ]),
    );
  }
}
