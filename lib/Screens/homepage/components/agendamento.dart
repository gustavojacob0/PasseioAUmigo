import 'package:flutter/material.dart';

class Agendamento extends StatefulWidget {
  const Agendamento({Key? key}) : super(key: key);

  @override
  State<Agendamento> createState() => _AgendamentoState();
}

class _AgendamentoState extends State<Agendamento> {
  String nomeAnimal = "";
  DateTime dataHoraPasseio = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nome do Animal:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  nomeAnimal = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Data e Hora do Passeio:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );

                if (selectedDate != null) {
                  final selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (selectedTime != null) {
                    setState(() {
                      dataHoraPasseio = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                    });
                  }
                }
              },
              child: Text('Selecionar Data e Hora'),
            ),
            SizedBox(height: 10),
            Text(
              '${dataHoraPasseio.toLocal()}'.split(' ')[0],
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '${dataHoraPasseio.toLocal()}'.split(' ')[1],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implementar a lógica de agendamento aqui
                print('Nome do Animal: $nomeAnimal');
                print('Data e Hora do Passeio: $dataHoraPasseio');
              },
              child: Text('Agendar Passeio'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: Agendamento(),
));
