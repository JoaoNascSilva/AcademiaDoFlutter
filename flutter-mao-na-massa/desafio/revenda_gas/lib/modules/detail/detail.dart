import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:revenda_gas/model/companhia.dart';

import 'widget/progresso.dart';

// ignore: must_be_immutable
class HomeDetail extends StatefulWidget {
  final Companhia companhia;
  HomeDetail({Key key, this.companhia}) : super(key: key);

  @override
  _HomeDetailState createState() => _HomeDetailState(companhia);
}

class _HomeDetailState extends State<HomeDetail> {
  final formatNumberPrice =
      NumberFormat.currency(name: 'R\$', locale: 'pt_BR', decimalDigits: 2);

  final Companhia companhia;
  _HomeDetailState(this.companhia);

  int quantidade = 1;
  double total = 0.0;

  void atualizaValorTotal() {
    total = quantidade * companhia.preco;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      atualizaValorTotal();
    });
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        actions: [
          Icon(Icons.more_vert),
        ],
        title: Text(
          'Selecionar Produtos',
          style: TextStyle(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Progresso('Comprar', true),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 24),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                ),
                Progresso('Pagamento', false),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 24),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                ),
                Progresso('Confirmar', false),
              ],
            ),
          ),
          SizedBox(
            height: 2,
            child: Container(color: Colors.transparent),
          ),
          resumoPedido(),
          grupoEmpresa(),
          SizedBox(
            height: 0.5,
          ),
          grupoItem(),
          Expanded(
            child: Container(),
          ),
          botaoPagamento(),
        ],
      ),
    );
  }

  Widget resumoPedido() {
    return SizedBox(
      height: 60,
      child: Container(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: Color(
                    int.parse(
                      'FF${companhia.cor}',
                      radix: 16,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(90),
                ),
                child: Center(
                  child: Text(
                    quantidade.toString() ?? '0',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    '${companhia.nome} - Botijao de 13Kg',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Container(
                width: 90,
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        formatNumberPrice.format(total),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget grupoItem() {
    return Container(
      margin: EdgeInsets.only(left: 18, right: 18),
      padding: EdgeInsets.only(top: 12, right: 18, bottom: 12),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        color: Colors.white,
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    'Botijao de 13Kg',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    companhia.nome,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: RichText(
                    text: TextSpan(
                      text: formatNumberPrice.format(companhia.preco),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(90),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (quantidade > 1) quantidade--;
                  atualizaValorTotal();
                });
              },
              child: Center(
                child: Text(
                  '--',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 80,
                width: 60,
                child: Image.asset(
                  './assets/images/gas-bottle.png',
                  color: Color(
                    int.parse(
                      'FF${companhia.cor}',
                      radix: 16,
                    ),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 22,
                child: Container(
                  height: 20,
                  width: 18,
                  decoration: BoxDecoration(
                    color: Colors.orange[400],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      quantidade.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(90),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  quantidade++;
                  atualizaValorTotal();
                });
              },
              child: Center(
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget grupoEmpresa() {
    return Container(
      margin: EdgeInsets.only(left: 18, right: 18, top: 18),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 14, right: 14),
                  //color: Colors.black,
                  child: Center(
                    child: Icon(
                      Icons.home,
                      color: Colors.grey[500],
                      size: 38,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 180,
                child: Text(
                  companhia.nome,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                width: 180,
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        companhia.nota.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      width: 20,
                      child: Center(
                        child: Icon(
                          Icons.star,
                          size: 12,
                          color: Colors.yellow[800],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        '${companhia.tempoMedio} min',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 12, top: 12),
                width: 90,
                height: 30,
                color: Color(int.parse('FF${companhia.cor}', radix: 16)),
                child: Center(
                    child: Text(companhia.tipo,
                        style: TextStyle(color: Colors.white))),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding botaoPagamento() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[400],
              Colors.blue[800],
            ],
          ),
          borderRadius: BorderRadius.circular(45),
        ),
        margin: EdgeInsets.only(bottom: 20),
        height: 80,
        width: 280,
        child: MaterialButton(
          onPressed: () {},
          child: Center(
            child: Text(
              'IR PARA PAGAMENTO',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          //color: Colors.transparent,
        ),
      ),
    );
  }
}
