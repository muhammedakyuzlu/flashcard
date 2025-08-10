import 'package:flashcard/product/init/application_initialize.dart';
import 'package:flashcard/product/init/theme/custom_dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:pinyin/pinyin.dart';

import 'flash_card_mixin.dart';
import 'flash_card_model.dart';

Future<void> main() async {
  await ApplicationInitialize().make();
  runApp(
    MaterialApp(
      theme: CustomDarkTheme().themeData,
      home: Builder(
        builder:
            (context) => Scaffold(
              appBar: AppBar(title: const Text('Language Card')),
              body: Column(
        
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                  ),
                  const FlashCard(),
                  
                ],
              ),
              backgroundColor: context.general.colorScheme.primary,
            ),
      ),
    ),
  );
}

class FlashCard extends StatefulWidget {
  const FlashCard({super.key});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> with FlashcardData {
  @override
  Widget build(BuildContext context) {
    final flashcards = data.categories?.first.flashcards ?? [];
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: PageView(
        children:
            flashcards
                .map((flashcard) => FlashCardShow(data: flashcard))
                .toList(),
      ),
    );
  }
}

class FlashCardShow extends StatelessWidget {
  const FlashCardShow({required this.data, super.key});

  final Flashcard data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1, left: MediaQuery.of(context).size.width * 0.1),
      color: context.general.colorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 4,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data.keyword ?? 'No Data',
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              PinyinHelper.getPinyin(
                data.keyword ?? '',
                format: PinyinFormat.WITH_TONE_MARK,
              ),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
