import 'package:calculadora_imc/pages/calculadora_imc_page.dart';
import 'package:calculadora_imc/pages/configuracoes_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                context: context,
                builder: (BuildContext bc) {
                  return Wrap(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: const Text("Calculadora IMC"),
                        leading: const Icon(Icons.camera),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: const Text("Configurações"),
                        leading: const Icon(Icons.album),
                      ),
                    ],
                  );
                });
          },
          child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.black),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                    "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
              ),
              accountName: const Text("Felipe Silva"),
              accountEmail: const Text("felipeosilva@hotmail.com")),
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 5),
                  Text("Calculadora IMC"),
                ],
              )),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CalculadoraImcPage()));
          },
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 5),
                  Text("Configurações"),
                ],
              )),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (bc) => const ConfiguracoesPage()));
          },
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 5),
                  Text("Sair"),
                ],
              )),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    alignment: Alignment.centerLeft,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    title: const Text("Meu App",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    content: const Wrap(
                      children: [
                        Text("Você sairá do aplicativo!"),
                        Text("Deseja realmente sair do aplicativo?"),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Não")),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CalculadoraImcPage()));
                          },
                          child: const Text("Sim"))
                    ],
                  );
                });
          },
        ),
      ]),
    );
  }
}
