# サンプル問題 - トラブルバスター演習

## 問題

PostgreSQLサーバに接続しようとしたところ、時々エラーが発生して接続できません。
設定を修正して問題を解消しましょう。

**前提条件**: なし

**[開始]** ボタンをクリックして次のステップに進みます。


## 環境セットアップ

以下のコマンドで環境を準備します。

```bash
cd ~/tbuster
./setup_postgresql.sh
```

`PostgreSQL setup is complete.` と表示されたら完了です。

## エラーが発生しないとき

以下のコマンドでPostgreSQLに接続できます。

```bash
sudo -u postgres psql
```


切断するには以下のコマンドを実行します。

```bash
\q
```

## エラーが発生するとき

以下のコマンドで1分間エラーが発生するときを再現できます。

```bash
./error01.sh
```


以下のコマンドでもう一度PostgreSQLに接続してみましょう。
エラーで接続できなくなっています。

```bash
sudo -u postgres psql
```

上記コマンド実行中もエラーなくPostgreSQLに接続できるよう対処してみましょう！

対処出来たら次に進んでください。

---
以下のように引数を付けて指定した秒数だけ（例は10秒）エラーを再現することもできます。

```bash
./error.sh 10
```



## Complete!

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

無事トラブルが解消できました。  
以下のコマンドで得られるデータベース内の文字列をFormsに入力しましょう。


```bash
sudo -u postgres psql -d tbusterdb -c "select text001 from tbuster_table where key='aa';" -t -A
```
