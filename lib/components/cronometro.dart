import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../store/pomodoro.store.dart';
import 'cronometro_botao.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(
      builder: (context) {
        return Container(
          color: store.estaTrabalhando() ? Colors.red : Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                store.estaTrabalhando()
                    ? 'hora de trabalhar'
                    : 'hora de descansar',
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              Text(
                '${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
                style: const TextStyle(
                  fontSize: 120,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!store.iniciado)
                    CronometroBotao(
                      texto: 'Iniciar',
                      icone: Icons.play_arrow,
                      evento: store.iniciar,
                    ),
                  if (store.iniciado)
                    CronometroBotao(
                      texto: 'Parar',
                      icone: Icons.stop,
                      evento: store.parar,
                    ),
                  CronometroBotao(
                    texto: 'Reiniciar',
                    icone: Icons.refresh,
                    evento: store.reiniciar,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
