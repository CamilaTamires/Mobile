import 'package:flutter/material.dart';

// Cria a classe SensorData para representar os dados dos sensores
class SensorData {
  final String title; // Título do sensor
  final String value; // Valor medido pelo sensor
  final String status; // Status do sensor (exemplo: "Bom", "Ruim")
  final Color statusColor; // Cor associada ao status do sensor
  final String imagePath; // Caminho da imagem representando o sensor

  // Construtor da classe SensorData
  SensorData({
    required this.title, 
    required this.value,
    required this.status, 
    required this.statusColor,
    required this.imagePath
  });
}

// Cria a classe da tela 2 (ColetaDadosScreen)
class ColetaDadosScreen extends StatelessWidget {
  ColetaDadosScreen({super.key});

  // Lista de sensores com dados pré-definidos
  final List<SensorData> sensores = [
    // Sensor 1: Umidade do solo
    SensorData(
      title: 'Umidade do solo', 
      value: '80%', 
      status: 'Bom', 
      statusColor: Colors.blue, 
      imagePath: 'images/1.png'
    ),
    // Sensor 2: Temperatura
    SensorData(
      title: 'Temperatura', 
      value: '25 ºC', 
      status: 'Bom', 
      statusColor: Colors.blue, 
      imagePath: 'images/2.png'
    ),
    // Sensor 3: Luminosidade
    SensorData(
      title: 'Luminosidade', 
      value: '80%', 
      status: 'Bom', 
      statusColor: Colors.blue, 
      imagePath: 'images/3.png'
    ),
    // Sensor 4: Níveis de pH
    SensorData(
      title: 'Níveis de pH', 
      value: '2', 
      status: 'Ruim', 
      statusColor: Colors.red, 
      imagePath: 'images/4.png'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF5EE), // Cor de fundo da tela
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Torna a AppBar transparente
        elevation: 0, // Sem sombra na AppBar
        leading: IconButton(
          onPressed: () => Navigator.pop(context), // Navega de volta para a tela anterior
          icon: Icon(Icons.arrow_back, color: Colors.brown),
        ),
        title: Text(
          'Monitoramento', // Título da tela
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // Centraliza o título
      ),
      // Widget ListView.builder que cria uma lista dinâmica de sensores
      body: ListView.builder(
        itemCount: sensores.length, // Quantidade de sensores na lista
        itemBuilder: (context, index) {
          final sensor = sensores[index]; // Pega o sensor atual da lista
          return SensorCard(sensor: sensor); // Chama o widget SensorCard para exibir o sensor
        },
      ),
      // Barra de navegação inferior (BottomNavigationBar)
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF40251C), // Cor de fundo da barra
        selectedItemColor: Colors.white, // Cor do item selecionado
        unselectedItemColor: Colors.white60, // Cor do item não selecionado
        currentIndex: 0, // Define o índice do item selecionado inicialmente
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ícone do item "Home"
            label: '', // Rótulo vazio
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart), // Ícone do item "Gráfico"
            label: '', // Rótulo vazio
          ),
        ],
      ),
    );
  }
}

// Cria o widget SensorCard, que exibe as informações de cada sensor
class SensorCard extends StatelessWidget {
  final SensorData sensor; // Objeto SensorData que será exibido

  // Construtor do widget SensorCard
  SensorCard({super.key, required this.sensor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16), // Espaço entre os cards
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // Bordas arredondadas no card
      elevation: 4, // Sombra do card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Garante que o conteúdo ocupe toda a largura
        children: [
          // Exibe a imagem do sensor
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)), // Bordas arredondadas na parte superior
            child: Image.asset(
              sensor.imagePath, // Caminho da imagem do sensor
              height: 120, // Altura da imagem
              fit: BoxFit.cover, // Ajuste da imagem dentro do espaço
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16), // Espaçamento dentro do card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Centraliza o conteúdo
              children: [
                // Exibe o título do sensor
                Text(
                  sensor.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8), // Espaço entre o título e o valor
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaça os itens no Row
                  children: [
                    // Exibe o valor do sensor
                    Text(
                      sensor.value,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    // Exibe o status do sensor
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12), // Bordas arredondadas no container
                      ),
                      child: Text(
                        sensor.status, // Texto de status
                        style: TextStyle(
                          color: sensor.statusColor, // Cor do status (dependente do sensor)
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
