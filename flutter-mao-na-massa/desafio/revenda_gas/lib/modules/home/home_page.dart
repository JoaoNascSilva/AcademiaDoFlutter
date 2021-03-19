import 'package:flutter/material.dart';
import 'package:revenda_gas/model/companhia.dart';
import 'package:revenda_gas/modules/detail/detail.dart';
import 'package:revenda_gas/modules/home/widgets/descricao_marca.dart';
import 'package:revenda_gas/modules/home/widgets/nota_widget.dart';
import 'package:revenda_gas/modules/home/widgets/tempo_medio.dart';
import 'package:revenda_gas/repositories/CompanhiaRepository.dart';

import 'widgets/preco_widget.dart';
import 'widgets/tag_melhor_preco_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Escolha uma revenda'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.swap_vert),
            elevation: 3,
            initialValue: 0,
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: true,
                child: ListTile(
                  title: Text(
                    'Melhor Avaliacao',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                  trailing: Icon(
                    Icons.check_box_outline_blank_rounded,
                  ),
                ),
              ),
              const PopupMenuItem(
                value: true,
                child: ListTile(
                  title: Text(
                    'Mais rapido',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                  trailing: Icon(
                    Icons.check_box_outline_blank_rounded,
                  ),
                ),
              ),
              const PopupMenuItem(
                value: true,
                child: ListTile(
                  title: Text(
                    'Mais Barato',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                  trailing: Icon(
                    Icons.check_box_outline_blank_rounded,
                  ),
                ),
              ),
            ],
          ),
          PopupMenuButton(
            icon: Icon(Icons.help),
            itemBuilder: (_) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: ListTile(
                  title: Text(
                    'Suporte',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  title: Text(
                    'Termos de Uso',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Botijoes de 13 kg em:',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                      Text(
                        'Av Paulista, 1001',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'Paulista, Sao Paulo, SP',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 28,
                      ),
                      Text(
                        'Mudar',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Companhia>>(
              future: CompanhiaRepository().buscarTodasCompanhias(),
              // ignore: missing_return
              builder: (_, snapShot) {
                switch (snapShot.connectionState) {
                  case ConnectionState.none:
                    return Container();
                    break;
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  case ConnectionState.active:
                  case ConnectionState.done:
                    var data = snapShot.data;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, index) {
                        return _builder(
                          _,
                          data[index],
                        );
                      },
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _builder(_, Companhia companhia) {
    return InkWell(
      onTap: () => Navigator.push(
        _,
        MaterialPageRoute(
          builder: (_) => HomeDetail(companhia: companhia),
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(12),
        height: 100,
        width: double.infinity,
        //width: MediaQuery.of(_).size.width * 0.82,
        child: Row(
          children: [
            descricaoMarca(
              descricao: companhia.tipo,
              cor: Color(
                int.parse(
                  'FF${companhia.cor}',
                  radix: 16,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 12, top: 12),
                          height: 24,
                          child: Text(
                            companhia.nome,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        TagMelhorPreco(companhia.melhorPreco),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Nota(companhia.nota),
                        TempoMedio(companhia.tempoMedio),
                        Preco(companhia.preco),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
