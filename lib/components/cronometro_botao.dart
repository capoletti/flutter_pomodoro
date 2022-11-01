import 'package:flutter/material.dart';

class CronometroBotao extends StatelessWidget {
  const CronometroBotao({
    required this.texto,
    required this.icone,
    this.evento,
    super.key,
  });

  final void Function()? evento;
  final String texto;
  final IconData icone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          textStyle: const TextStyle(
            fontSize: 20,
          ),
        ),
        onPressed: evento,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                icone,
                size: 30,
              ),
            ),
            Text(texto),
          ],
        ),
      ),
    );
  }
}
