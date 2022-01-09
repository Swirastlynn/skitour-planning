import 'package:tuple/tuple.dart';

// todo Tuple3 with interesting fact
class QuestionsRepository {
  static const List<Tuple2<String, String>> phase1 = [
    Tuple2('Rozwiń skrót PRL.',
        'Polska Rzeczpospolita Ludowa, ale uznaną odpowiedzią byłoby utarte w powiedzeniu “Prywatne Ranczo Lenina”'),
    Tuple2('Ulubiona bajka o piesku PRLowskich dzieci nosiła tytuł?', 'Reksio'),
    Tuple2('Czy Albania należała do bloku państw komunistycznych?', 'Tak'),
    Tuple2('Czy PSL należała do partii komunistycznych w okresie PRL?', 'Nie'),
    Tuple2('Które z polskich miast nosiło nazwe Stalinogród?', 'Katowice'),
  ];
  static const List<Tuple2<String, String>> phase2 = [
    Tuple2(
        '''Słynne powiedzenie z czasów dekady Gierkowskiej “Czy się stoi, czy się leży ... tysiące się należy."
           To ile należy się tych tysięcy?''',
        'Zależy kiedy, lecz najczęściej powtarzają się dwa tysiące.'),
    Tuple2(
        'Tzw. karnawał Solidarności miał miejsce w latach: 1980-1981 czy 1988-1989?',
        '1980-1981'),
  ];
  static const List<Tuple2<String, String>> phase3 = [
    Tuple2(
        'Jakie miano nosił najsłynniejszy polski samochód dostawczy czasów PRL?',
        'ŻUK'),
    Tuple2('Jak się nazywa przedsiębiorstwo prowadzące catering w pociągach?',
        'Wars'),
    Tuple2(
        'Czy synowie Gierka wybudowali wille za państwowe pieniądze?', 'Tak'),
    Tuple2(
        'Jaki produkt spożywczy można było znaleźć na sklepowych półkach przez cały okres PRL?',
        'Ocet'),
    Tuple2('Czy Jerzy Urban pisał w Polityce?',
        'Tak, wyrzucono go stamtąd, podobno na polecenie samego Gomułki'),
  ];
}
