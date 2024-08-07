# image_to_text_translate

Take a picture from your camera or add it from gallery.
Google MLKit takes the image and detects all texts.
Translate package will translate it.
It translates English to Turkish but you can change it in translation.dart file

Future<Translation> cevir() {
    Future<Translation> ceviri =
        translator.translate(scannedText, from: 'en', to: 'tr');
    return ceviri;
  }

Here in this code, you just need to change "en" and "tr" keywords with the language you like.


