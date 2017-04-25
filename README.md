# Apache + PHP + MySQL By Vagrant

開発環境用 Apache + PHP + MySQL サーバを構築するための Vagrant の設定です。

## 構成

ゲスト OS の構成は以下のようになります。

 - Ubuntu 16.04.2 LTS (GNU/Linux 4.4.0-66-generic x86_64)　
 - Apache 2.4.18
   - /vagrant_data/site 配下を公開
   - rewrite
 - PHP 7.0
   - mbstring
   - SQLite3
   - PEAR
   - XDebug
 - MySQL 5.7.17
   - root パスワード: 1234qwer

## 前提構成

 - [VirtualBox](https://www.virtualbox.org/)
 - [Vagrant](https://www.vagrantup.com/)
 - 任意の ssh クライアント

## 設定

config.sample.json を環境に合わせて編集して config.json の名前で保存してください。

各設定項目については config.sample.json 内のコメントを参照してください。

## 使い方

各 vagrant コマンドは、ApachePHPMySQLServerByVagrant のルートディレクトリで実行します。

### 環境構築から起動まで

最初に vagrant up で環境を構築します。

```
vagrant up
```

VM が立ち上がったら vagrant ssh でログインできます。

```
vagrant ssh
```

### Apache へのアクセス

config.json で private_network_ip および site_root_dir を設定している場合は、
ブラウザに private_network_ip を入力することで site_root_dir 配下のページにアクセスできます。

以下は private_network_ip に 192.168.33.10 を設定している場合の URL 入力例です。

```
http://192.168.33.10/
```

### MySQL へのアクセス

ホストから MySQL にアクセスするには、以下の設定を使用します。

| 項目名     | 設定値        | 補足                       |
|------------|---------------|----------------------------|
| ホスト名   | 192.168.33.10 | private_network_ipの設定値 |
| ユーザ名   | root          |                            |
| パスワード | 1234qwer      |                            |
