import 'package:flutter_test/flutter_test.dart';
import 'package:razio/entity/favorite_program.dart';

void main() {
  group('seriesTitleOf', () {
    test('枠や回の表記を取り除く', () {
      expect(seriesTitleOf('荻上チキ・Session (1)'), '荻上チキ・Session');
      expect(seriesTitleOf('基礎英語　レベル２（９８）'), '基礎英語　レベル２');
      expect(seriesTitleOf('SAISON CARD TOKIO HOT 100(PART3)'),
          'SAISON CARD TOKIO HOT 100');
      expect(seriesTitleOf('中川家 ザ・ラジオショー（13時台）'), '中川家 ザ・ラジオショー');
      expect(
        seriesTitleOf('春風亭一蔵 ラジオマガジンフライデー！ 10時～11時'),
        '春風亭一蔵 ラジオマガジンフライデー！',
      );
      expect(
        seriesTitleOf('大竹まこと ゴールデンラジオ！ 11時30分～13時'),
        '大竹まこと ゴールデンラジオ！',
      );
      expect(
        seriesTitleOf('文化放送 ライオンズナイター 20時～21時15分'),
        '文化放送 ライオンズナイター',
      );
    });

    test('番組の区別に関わる表記は残す', () {
      expect(
          seriesTitleOf('佐久間宣行のオールナイトニッポン0(ZERO)'), '佐久間宣行のオールナイトニッポン0(ZERO)');
      expect(seriesTitleOf('前田公輝のヒラケテヒラク（再）'), '前田公輝のヒラケテヒラク（再）');
      expect(seriesTitleOf('ニュース・気象情報（関東）'), 'ニュース・気象情報（関東）');
      expect(seriesTitleOf('JUNK 爆笑問題カーボーイ'), 'JUNK 爆笑問題カーボーイ');
    });

    test('枠の表記だけのタイトルはそのまま', () {
      expect(seriesTitleOf('(1)'), '(1)');
    });
  });

  test('以前の枠ごとのタイトルで保存したお気に入りも番組シリーズとして読み込む', () {
    final favorite = FavoriteProgram.fromJson({
      'stationId': 'TBS',
      'title': '荻上チキ・Session (1)',
      'img': '',
    });
    expect(favorite.title, '荻上チキ・Session');
    expect(favorite.matches(stationId: 'TBS', title: '荻上チキ・Session (3)'), true);
    expect(
        favorite.matches(stationId: 'QRR', title: '荻上チキ・Session (3)'), false);
  });
}
