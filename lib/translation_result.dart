import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslationResultPage extends StatefulWidget {
  final String scannedText;
  final String fromLanguage;
  final String toLanguage;

  const TranslationResultPage({
    Key? key,
    required this.scannedText,
    required this.fromLanguage,
    required this.toLanguage,
  }) : super(key: key);

  @override
  State<TranslationResultPage> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationResultPage> {
  Future<Translation>? _translationFuture;

  final translator = GoogleTranslator();

  @override
  void initState() {
    super.initState();
    _translationFuture = translator.translate(
      widget.scannedText,
      from: widget.fromLanguage,
      to: widget.toLanguage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Çeviri'),
        backgroundColor: Colors.blue[150],
      ),
      body: FutureBuilder<Translation>(
        future: _translationFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final translation = snapshot.data!;
            return Center(
              child: Text(
                translation.text,
                style: TextStyle(fontSize: 24),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Çeviri hatası: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
