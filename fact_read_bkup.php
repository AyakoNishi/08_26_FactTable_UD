<?php

// DB接続情報
include('functions.php');
$pdo = connect_to_db();

//SQL
$sql = 'SELECT E.id, A.kind_cd, A.kind_nm, B.coffee_cd, B.coffee_nm, 
C.brend_cd, C.brend_nm, 
D.hot_nm, C.brend_price as unit_price, 
E.count_c, E.count_c *  C.brend_price as price , E.memo
FROM cafe_table E, kind_table A, coffee_table B, brend_table C, hot_table D 
WHERE (E.kind_cd = A.kind_cd) 
AND (E.coffee_cd = B.coffee_cd) 
AND (E.brend_cd = C.brend_cd) 
AND (E.hot_cd = D.hot_cd) 
ORDER BY E.id';
// $sql = 'SELECT * FROM cafe_table';
$stmt = $pdo->prepare($sql);
$status = $stmt->execute();

if ($status == false) {
  $error = $stmt->errorInfo();
  echo json_encode(["error_msg" => "{$error[2]}"]);
  exit();
} else {
  $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
  $output = "";
  foreach ($result as $record) {
    $output .= "<tr>";
    $output .= "<td>{$record["kind_cd"]}</td>";
    $output .= "<td>{$record["kind_nm"]}</td>";
    $output .= "<td>{$record["coffee_cd"]}</td>";
    $output .= "<td>{$record["coffee_nm"]}</td>";
    $output .= "<td>{$record["brend_cd"]}</td>";
    $output .= "<td>{$record["brend_nm"]}</td>";
    $output .= "<td>{$record["hot_nm"]}</td>";
    $output .= "<td>{$record["unit_price"]}</td>";
    $output .= "<td>{$record["count_c"]}</td>";
    $output .= "<td>{$record["price"]}</td>";
    $output .= "<td>{$record["memo"]}</td>";
    // edit deleteリンクを追加
    $output .= "<td><a href='fact_edit.php?id={$record["id"]}'>更新</a></td>";
    $output .= "<td><a href='fact_delete.php?id={$record["id"]}'>削除</a></td>";
    $output .= "</tr>";
  }
  unset($record);
}

?>

<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/style.css">
  <title>カフェ売り上げ実績（ファクトテーブル実践）</title>
</head>

<body>
  <fieldset>
    <legend>カフェ売り上げ実績（ファクトテーブル実践）</legend>
    <a href="fact_input.php">入力画面</a>
    <table class="fact_t">
      <thead>
        <tr>
          <th>カテゴリ</th>
          <th>カテゴリ名</th>
          <th>メニューコード</th>
          <th>メニュー</th>
          <th>アイテムコード</th>
          <th>アイテム名</th>
          <th>HOT/ICE</th>
          <th>単価</th>
          <th>数量</th>
          <th>金額</th>
          <th>備考</th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <!-- <input type="radio" name="line_cd"> -->
        <!-- ここに<tr><td>deadline</td><td>todo</td><tr>の形でデータが入る -->
        <?= $output ?>
      </tbody>
    </table>

  </fieldset>
</body>

</html>