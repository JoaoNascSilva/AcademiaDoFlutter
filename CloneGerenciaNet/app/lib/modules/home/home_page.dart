import 'package:app/shared/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 0),
        child: Container(color: AppColors.ColorPrimary),
      ),
      body: Stack(
        children: [
          _buildImage(width, height),
          _buildBody(width, height),
          Positioned(
            top: 460,
            child: Container(
              height: 64,
              width: width * .94,
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: TextButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    AppColors.colorButton,
                  ),
                ),
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 38,
                ),
                label: Text(
                  'Acessar conta',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 534,
            child: Container(
              height: 64,
              width: width * .94,
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: TextButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                ),
                icon: Icon(
                  Icons.person_add_alt_1_outlined,
                  color: AppColors.colorButton,
                  size: 38,
                ),
                label: Text(
                  'Abrir uma conta',
                  style: TextStyle(
                    color: AppColors.colorButton,
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

  Column _buildBody(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildVersion(),
        _buildLogo(width),
        _buildMessages(height, width),
        Expanded(
          child: Container(
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButtonBottom(
                  icon: Icons.live_help_outlined,
                  title: 'Precisa \n de ajuda?',
                ),
                _buildButtonBottom(
                  icon: Icons.payment_outlined,
                  title: 'PIX',
                ),
                _buildButtonBottom(
                  icon: Icons.library_books_outlined,
                  title: 'Termos \n de uso?',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Center _buildButtonBottom({IconData? icon, String? title}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.ColorPrimary,
            child: CircleAvatar(
              maxRadius: 18.5,
              backgroundColor: Colors.white,
              child: Icon(
                icon,
                color: AppColors.ColorPrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title ?? '',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildImage(double width, double height) {
    return Container(
      width: width,
      height: height * .70,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage('assets/imagem_fundo.jpg'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Container _buildMessages(double height, double width) {
    return Container(
      color: AppColors.ColorPrimary.withAlpha(200),
      padding: EdgeInsets.symmetric(vertical: 52, horizontal: 12),
      height: height * .527,
      width: width,
      child: Column(
        children: [
          Text(
            'Soluções para descomplicar a gestão financeira,',
            style: TextStyle(
              fontSize: 38,
              color: Colors.white,
            ),
          ),
          Text(
            'pensadas para você e seu negócio.',
            style: TextStyle(
              fontSize: 38,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: _buildPageIndicator(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < 6; i++) {
      list.add(Padding(
        padding: const EdgeInsets.only(left: 18, top: 18),
        child: Container(
          alignment: Alignment.centerLeft,
          //margin: EdgeInsets.only(left: 12, top: 12),
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(360),
          ),
        ),
      ));
    }
    return list;
  }

  Container _buildLogo(double width) {
    return Container(
      color: AppColors.ColorPrimary.withAlpha(200),
      padding: EdgeInsets.only(
        left: 8,
        top: 8,
        right: 8,
        bottom: 12,
      ),
      height: 90,
      width: width,
      child: Image.asset(
        'assets/logo.png',
        color: Colors.white,
      ),
    );
  }

  Container _buildVersion() {
    return Container(
      color: AppColors.ColorPrimary.withAlpha(200),
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Text(
        'G-6.0.1',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
