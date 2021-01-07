<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>カフェ売り上げ実績（ファクトテーブル実践）</title>
</head>

<body>
  <form action="fact_create.php" method="POST">
    <fieldset>
      <legend>カフェ売り上げ実績（ファクトテーブル実践）</legend>
      <a href="fact_read.php">一覧画面</a>（入力例の数字で入力してください）
      <div>
        カテゴリ: <input type="text" name="kind_cd">
      </div>
      <div>
        商品: <input type="text" name="coffee_cd">
      </div>
      <div>
        詳細: <input type="text" name="brend_cd">
      </div>
      <div>
        ICE/HOT: <input type="text" name="hot_cd">
      </div>
      <div>
        数量: <input type="text" name="count_c">
      </div>
      <div>
        <button>送信</button>
      </div>
    </fieldset>
  </form>

  <div>
    <h2>入力例</h2>
    <div>
      <p>カテゴリ：　1.ドリンク,　2.フード, 3.デザート</p>
      <p>メニュー：　1.珈琲,　2.紅茶, 3.フレッシュジュース, 4.ミルク</p>
      <p>アイテム：　1.ブレンド,　2.アイスコーヒー, 3.カプチーノ, 4.カフェラテ</p>
      <p>hot/ice：　1.hot,　2.ice</p>

    </div>
  </div>

</body>

</html>