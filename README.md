# ブクログ検索

## 概要

flutterで開発したアプリです  
ブクログでは本棚内検索で引っかからないタイトルがあるため、開発しました  

## アプリ概要

本棚データをAPIで取得し、タイトルを全文検索します  
著作者は取得できなかったため、検索できません  

## 追加パッケージ

|名前|機能|備考|
|:-|:-|:-|
|http|通信用||
|url_launcher|ブラウザ起動用||
|shared_preferences|設定データ保存用||
|cached_network_image|本の表紙画像キャッシュ用||
|isar|本棚データ格納用|Web版使用のため、2.5.0を使用|
|isar_flutter_libs|本棚データ格納用|Web版使用のため、2.5.0を使用|
|path_provider|ファイルアクセス用||

## 追加開発パッケージ

|名前|機能|備考|
|:-|:-|:-|
|isar_generator|本棚データ格納用|Web版使用のため、2.5.0を使用|
|build_runner|ローカルデータベースデータ生成用||
