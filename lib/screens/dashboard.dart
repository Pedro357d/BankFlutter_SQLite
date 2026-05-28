import 'package:flutter/material.dart';
// Mantenha os imports originais
import 'contatos/lista_contatos.dart';
import 'transferencia/lista.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Definindo uma paleta de cores consistente e elegante
    const Color primaryColor = Color(0xFF004D40); // Verde Petróleo Profundo
    const Color accentColor = Color(0xFF00796B); // Verde Teal para os ícones
    const Color backgroundColor = Color(0xFFF9FBFB); // Fundo quase branco, frio

    return Scaffold(
      backgroundColor: backgroundColor,
      // AppBar limpa e integrada
      appBar: AppBar(
        title: const Text(
          "Bytebank",
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w800,
            fontSize: 24,
            letterSpacing: -0.5,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calcula o espaçamento baseado na altura da tela
            final double verticalSpacing = constraints.maxHeight * 0.08;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Espaço após o AppBar
                  SizedBox(height: verticalSpacing * 0.5),

                  // A Imagem integrada ao design
                  // Centralizada e com um fundo circular sutil para destaque
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 30,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            16), // Mantém a borda arredondada na imagem
                        child: Image.asset(
                          "images/bytebank_logo.png",
                          height: 180, // Mantive o tamanho aproximado
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  // Texto de Saudação/Instrução
                  SizedBox(height: verticalSpacing),
                  const Text(
                    "Serviços Disponíveis",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const Text(
                    "Selecione uma opção para continuar",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Funcionalidades (Suas rotas originais)
                  // Usei Row com Expanded para um layout responsivo
                  Row(
                    children: [
                      // Primeiro card: Contatos
                      Expanded(
                        child: _FeatureItem(
                          nome: 'Contatos',
                          icone: Icons.people_outline_rounded,
                          primaryColor: primaryColor,
                          accentColor: accentColor,
                          onClick: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ListaContatos()),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Segundo card: Transferências
                      Expanded(
                        child: _FeatureItem(
                          nome: 'Transferências',
                          icone: Icons.swap_horiz_rounded,
                          primaryColor: primaryColor,
                          accentColor: accentColor,
                          onClick: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ListaTransferencias()),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(), // Empurra o conteúdo para cima
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String nome;
  final IconData icone;
  final void Function() onClick;
  final Color primaryColor;
  final Color accentColor;

  const _FeatureItem({
    required this.nome,
    required this.icone,
    required this.onClick,
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Card com sombra sutil e fundo branco puro
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent, // Necessário para o InkWell funcionar
        child: InkWell(
          onTap: onClick,
          borderRadius:
              BorderRadius.circular(20), // Feedback tátil com o mesmo raio
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ícone em um círculo com cor suave de fundo
                CircleAvatar(
                  backgroundColor: accentColor.withOpacity(0.12),
                  radius: 30,
                  child: Icon(
                    icone,
                    color: accentColor,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 20),
                // Texto do botão
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    nome,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}