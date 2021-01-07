<?php
// var_dump($_POST);
// exit();
if (
  !isset($_POST['kind_cd']) || $_POST['kind_cd'] == '' ||
  !isset($_POST['coffee_cd']) || $_POST['coffee_cd'] == '' ||
  !isset($_POST['brend_cd']) || $_POST['brend_cd'] == '' ||
  !isset($_POST['hot_cd']) || $_POST['hot_cd'] == '' ||
  !isset($_POST['count_c']) || $_POST['count_c'] == ''
) {
  exit('ParamError');
}
$kind_cd = $_POST['kind_cd'];
$coffee_cd = $_POST['coffee_cd'];
$brend_cd = $_POST['brend_cd'];
$hot_cd = $_POST['hot_cd'];
$count_c = $_POST['count_c'];


// DB接続情報
$dbn = 'mysql:dbname=gsacf_d07_26;charset=utf8;port=3306;host=localhost';
$user = 'root';
$pwd = '';

// DB接続
try {
  $pdo = new PDO($dbn, $user, $pwd);
} catch (PDOException $e) {
  echo json_encode(["db error" => "{$e->getMessage()}"]);
  exit();
}

//SQL
// $sql = 'INSERT INTO
// cafe_table(id, kind_cd, coffee_cd, brend_cd, hot_cd, count_c, memo)
// VALUES(NULL, :kind_cd, :coffee_cd, :brend_cd, :hot_cd, :count_c, null)';
$sql = 'INSERT INTO
cafe_table 
VALUES(NULL, :kind_cd, 0, :coffee_cd, 0, :brend_cd, 0, :hot_cd, 0, :count_c, 0, "")';

$stmt = $pdo->prepare($sql);
$stmt->bindValue(':kind_cd', $kind_cd, PDO::PARAM_STR);
$stmt->bindValue(':coffee_cd', $coffee_cd, PDO::PARAM_STR);
$stmt->bindValue(':brend_cd', $brend_cd, PDO::PARAM_STR);
$stmt->bindValue(':hot_cd', $hot_cd, PDO::PARAM_STR);
$stmt->bindValue(':count_c', $count_c, PDO::PARAM_STR);
$status = $stmt->execute(); // SQLを実行

// 失敗時にエラーを出力し，成功時は登録画面に戻る
if ($status == false) {
  $error = $stmt->errorInfo();
  // データ登録失敗次にエラーを表示
  exit('sqlError:' . $error[2]);
} else {
  // 登録ページへ移動
  // header('Location:fact_input.php');
  header('Location:fact_read.php');
}
