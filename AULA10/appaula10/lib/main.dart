import 'package:appaula10/tela2.dart';
import 'package:appaula10/tela3.dart';
import 'package:flutter/material.dart';

void main() {
  // Inicia o aplicativo e define o widget inicial como DashboardScreen
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Remove o banner de depuração
    home: DashboardScreen(), // Tela inicial do aplicativo
  ));
}

// Cria uma classe StatelessWidget chamada DashboardScreen
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key}); // Construtor da classe

  // Sobrescreve o método build para criar a interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer é o menu lateral que pode ser aberto ao deslizar
      drawer: Drawer(
        child: ListView(
          // Padding zero significa que não há espaçamento extra
          padding: EdgeInsets.zero,
          // children contém a lista de itens do menu
          children: [
            // DrawerHeader é a área superior do menu lateral
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown, // Cor de fundo do header
              ),
              child: Text('Menu', style: TextStyle(color: Colors.white)), // Título do menu
            ),
            // Itens do menu
            ListTile(title: Text('Opção 1'),),
            ListTile(title: Text('Opção 2'),)
          ],
        ),
      ),
      // AppBar é a barra de navegação no topo
      appBar: AppBar(
        backgroundColor: Colors.brown, // Cor de fundo da AppBar
        elevation: 5, // Sombra da AppBar
        iconTheme: IconThemeData(color: Colors.white), // Cor dos ícones na AppBar
        centerTitle: true, // Centraliza o título
        title: Row(
          children: [
            // Exibe uma imagem à esquerda
            Image.asset('images/senai.png', height: 40,),
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'App Agro IoT', // Título do aplicativo
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(), // Espaço entre o título e o ícone de usuário
            // Exibe um avatar de usuário à direita
            CircleAvatar(
              backgroundColor: Colors.brown[100],
              child: Icon(Icons.person, color: Colors.brown),
            ),
          ],
        ),
      ),
      // Corpo principal da tela (Body)
      body: Column(
        children: [
          // Campo de texto para busca
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar ...', // Texto sugerido
                prefixIcon: Icon(Icons.search), // Ícone de pesquisa
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30), // Bordas arredondadas
                ),
              ),
            ),
          ),
          SizedBox(height: 20,), // Espaço entre o campo de busca e os botões

          // Criação de botões personalizados dentro de Cards
          _DashboardButton(
            icon: Icons.analytics_outlined,
            label: 'Monitoramento',
            onTap: () {
              // Navegação para a tela de ColetaDadosScreen quando o botão é pressionado
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ColetaDadosScreen()));
            },
          ),

          SizedBox(height: 10,), // Espaço entre os botões

          _DashboardButton(
            icon: Icons.settings_remote_outlined,
            label: 'Sistema de controle',
            onTap: () {
              // Navegação para a tela de Telaacionamento
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Telaacionamento()));
            },
          ),

          SizedBox(height: 10,), // Espaço entre os botões

          _DashboardButton(
            icon: Icons.smart_toy_outlined,
            label: 'Chatbot',
            onTap: () {},
          ),
        ],
      ),
      // Barra de navegação inferior (BottomNavigationBar)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Define o índice do item selecionado
        selectedItemColor: Colors.white, // Cor do item selecionado
        backgroundColor: Colors.brown[900], // Cor de fundo da barra inferior
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ícone de "Home"
            label: '', // Sem rótulo para o item
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), // Ícone de "Settings"
            label: '', // Sem rótulo para o item
          ),
        ],
      ),
    );
  }
}

// Cria um widget personalizado para os botões do Dashboard
class _DashboardButton extends StatelessWidget {
  // Atributos necessários para criar os botões
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  // Construtor com parâmetros obrigatórios
  const _DashboardButton({
    required this.icon, 
    required this.label, 
    required this.onTap
  });

  // Método build para desenhar o widget
  @override
  Widget build(BuildContext context) {
    // InkWell é um widget que detecta toques
    return InkWell(
      onTap: onTap, // Ação ao pressionar o botão
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16) // Bordas arredondadas
        ),
        elevation: 5, // Sombra do cartão
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Row(
            children: [
              // Exibe o ícone do botão
              Icon(
                icon, 
                color: Colors.brown, 
                size: 40,
              ),
              SizedBox(width: 16,), // Espaçamento entre o ícone e o texto
              // Exibe o texto do botão
              Text(
                label, 
                style: TextStyle(
                  fontSize: 18, 
                  color: Colors.brown
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
