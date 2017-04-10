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

config.rb を環境に合わせて編集してください。

## 使い方

```
vagrant up
vagrant ssh
```
