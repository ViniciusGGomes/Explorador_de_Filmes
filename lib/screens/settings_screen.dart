import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool darkModeEnabled = false; // Isso seria idealmente gerenciado por um Provider ou outro state manager

    return Scaffold(
      appBar: AppBar(title: Text('Configurações')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Conta'),
            subtitle: Text('Editar informações da conta'),
            onTap: () {
              // Implemente a lógica ou navegação aqui se desejar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Funcionalidade ainda não disponível')),
              );
            },
          ),
          Divider(),
          SwitchListTile(
            secondary: Icon(Icons.brightness_6),
            title: Text('Modo Escuro'),
            value: darkModeEnabled,
            onChanged: (value) {
              // Aqui você ativaria um tema escuro com Provider ou outro método
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Alternância de tema não implementada')),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Sobre'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Movie Explorer',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2025 Seu Nome',
              );
            },
          ),
        ],
      ),
    );
  }
}
