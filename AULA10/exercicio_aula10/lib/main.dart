import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DashboardScreen(),
  ));
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 104, 40),
        elevation: 5,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Monitor de Sensor',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            // Botão 1
            _DashboardButton(
              icon: Icons.thermostat_outlined, 
              label: 'Temperatura do Ar',
              degree: '25°C', 
            ),
            SizedBox(height: 20),
            // Botão 2
            _DashboardButton(
              icon: Icons.thermostat_outlined, 
              label: 'Umidade do Ar',
              degree: '60%',
            ),
            SizedBox(height: 20),
            // Botão 3
            _DashboardButton(
              icon: Icons.thermostat_outlined, 
              label: 'Temperatura do Solo',
              degree: '22°C', 
            ),
            SizedBox(height: 20),
            // Botão 4
            _DashboardButton(
              icon: Icons.thermostat_outlined, 
              label: 'Umidade do Solo',
              degree: '45%', 
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Dados atualizados!");
              },
              child: Text('Atualizar Dados'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 50, 104, 40), // Cor de fundo
                foregroundColor: Colors.white, // Cor do texto
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Classe para o botão personalizado
class _DashboardButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String degree; 

  const _DashboardButton({
    super.key,
    required this.icon,
    required this.label,
    required this.degree,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinha os elementos à esquerda
        children: [
          Row(
            children: [
              Icon(icon, color: const Color.fromARGB(255, 33, 243, 79)),
              SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            degree, 
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
