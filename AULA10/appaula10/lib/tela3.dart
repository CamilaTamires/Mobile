import 'package:flutter/material.dart';

// Criação da classe Telaacionamento, que é um StatefulWidget
class Telaacionamento extends StatefulWidget {
  const Telaacionamento({super.key});

  @override
  State<Telaacionamento> createState() => _TelaacionamentoState();
}

// Estado do widget Telaacionamento
class _TelaacionamentoState extends State<Telaacionamento> {
  // Variável que representa o status da bomba, inicialmente desligada
  final bool status = false;
  // Cor inicial do status da bomba (vermelho significa desligada)
  Color status_cor = Colors.red;

  // Função para ligar a bomba (muda a cor para verde)
  _ligarbomba() {
    setState(() {
      status_cor = Colors.green; // A cor da bomba muda para verde
    });
  }

  // Função para desligar a bomba (muda a cor para vermelho)
  _desligarbomba() {
    setState(() {
      status_cor = Colors.red; // A cor da bomba volta para vermelho
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF5EE), // Cor de fundo da tela
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Torna a AppBar transparente
        elevation: 0, // Sem sombra na AppBar
        leading: IconButton(
          onPressed: () => Navigator.pop(context), // Botão de voltar para a tela anterior
          icon: Icon(Icons.arrow_back, color: Colors.brown), // Ícone de voltar
        ),
        title: Text(
          'Acionamento',
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold), // Estilo do título da AppBar
        ),
        centerTitle: true, // Centraliza o título da AppBar
      ),
      // Corpo da tela
      body: Center(
        child: Column(
          children: [
            // Container que exibe o status da bomba
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center, // Alinha o texto no centro
                width: 200, // Largura do container
                height: 200, // Altura do container
                color: status_cor, // Cor do container, que varia dependendo do status da bomba
                child: Text(
                  "Bomba de irrigação", // Texto exibido no centro do container
                  textAlign: TextAlign.center, // Alinha o texto no centro
                  style: TextStyle(
                    fontSize: 20, // Tamanho da fonte
                    fontWeight: FontWeight.bold, // Estilo de fonte (negrito)
                    color: Colors.white, // Cor do texto
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity, // Faz o botão ocupar toda a largura disponível
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // Cor de fundo do botão
                  foregroundColor: Colors.white, // Cor do texto do botão
                ),
                onPressed: _ligarbomba, // Ao pressionar o botão, chama a função para ligar a bomba
                child: Text('Ligar bomba'), // Texto exibido no botão
              ),
            ),

            SizedBox(
              width: double.infinity, // Faz o botão ocupar toda a largura disponível
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // Cor de fundo do botão
                  foregroundColor: Colors.white, // Cor do texto do botão
                ),
                onPressed: _desligarbomba, // Ao pressionar o botão, chama a função para desligar a bomba
                child: Text('Desligar bomba'), // Texto exibido no botão
              ),
            ),
          ],
        ),
      ),
    );
  }
}
