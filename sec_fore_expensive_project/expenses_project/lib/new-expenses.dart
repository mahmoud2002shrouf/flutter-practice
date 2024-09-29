import "package:flutter/material.dart";
import "package:expenses_project/model/expens.dart";

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key, required this.addExpensesss});
  final void Function(Expense ex) addExpensesss;
  @override
  State<NewExpenses> createState() {
    return _NewExpenses();
  }
}

class _NewExpenses extends State<NewExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _slectedDate;
  Category _categorySlected = Category.food;

  void _showDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _slectedDate = pickedDate;
    });
  }

  void addExpenses() {
    final amountEnterd = double.tryParse(_amountController.text);
    final amoundInvalid = amountEnterd == null || amountEnterd < 0;
    final titleInvalid = _titleController.text.trim().isEmpty;
    if (amoundInvalid || titleInvalid || _slectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("invalid entered"),
                content: const Text(
                    "Please make sure a valid title, amount, date and category was entered."),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text("Okay"))
                ],
              ));
      return;
    }
    widget.addExpensesss(Expense(
        amount: amountEnterd,
        title: _titleController.text,
        category: _categorySlected,
        date: _slectedDate!));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(children: [
        const Text(
          "Add New Expenses ",
          style: TextStyle(
              fontSize: 20,
              fontFamily: AutofillHints.givenName,
              fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: const InputDecoration(label: Text("Title")),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                decoration: const InputDecoration(
                    label: Text("Amount"), prefixText: "\$   "),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(_slectedDate == null
                    ? "slected Date"
                    : format.format(_slectedDate!)),
                const SizedBox(
                  width: 30,
                ),
                IconButton(
                    onPressed: _showDate,
                    icon: const Icon(Icons.calendar_month))
              ],
            ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            DropdownButton(
              value: _categorySlected,
              items: Category.values
                  .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text(
                        category.name.toUpperCase(),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  _categorySlected = value;
                });
              },
            ),
            const Spacer(),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancle")),
                ElevatedButton(
                    onPressed: addExpenses, child: const Text("Save Expenses"))
              ],
            )
          ],
        )
      ]),
    );
  }
}
