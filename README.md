# アプリケーション名	
- Adventure

# アプリケーション概要
- 一緒に冒険する仲間を探すアプリケーション

# 主な機能
- ユーザー認証機能(devise)
- ルームの一覧を見てルームに参加もしくはルームを作成することでチャットができる
- ActionCableで双方向の非同期通信を実装しており、LINEのようなリアルタイムチャットができる
- スケジュールを作成できる。

# 実装予定の機能
- ToDo機能
- ギャラリー機能

# 洗い出した要件
- https://docs.google.com/spreadsheets/d/1ptD_lHr12gVQJV_pjUgENGp4ooPhLYcCM2RrN6xcjZE/edit?usp=sharing


# URL
- https://adventure-web.com

# DEMO
<img src="https://i.gyazo.com/df226cb9ee5a0da7a36e1ae19611cc6e.jpg" width="300px">

<img src="https://i.gyazo.com/0644d47c635546796efe517de5f95ebf.jpg" width="300px">

<img src="https://i.gyazo.com/3b8843d39db074297f0ff48182ed5d9e.jpg" width="300px">

<img src="https://i.gyazo.com/885f285e503a9141d235b0d85b9049b1.jpg" width="300px">

<img src="https://i.gyazo.com/501c18037a383c55d3d28c77e32b9cb7.jpg" width="300px">

# テスト用アカウント
- Email: test1@gmail.com
- Password: testtest

※（１人のユーザーは１つの部屋にしか所属できない仕様です）

# 目指した課題解決
- ワクワクを共有できる仲間が周りに居ない
- 一人で挑戦するのは不安

# 工夫した点
- ActionCableでリアルタイムでのチャットの実装
- AWSでのデプロイ、SSL通信

# 使用技術
- 言語
  - Ruby
  - JavaScript
  - HTML
  - CSS

- フレームワーク
  - Ruby on Rails

- 開発ツール・環境
  - GitHub
  - Visual Studio Code
  - AWS
    - EC2
    - Route53
    - ALB
  - MariaDB
  - MySQL
  - NGINX
  - Unicorn
  - Capistrano

# インフラ構成図
[![Image from Gyazo](https://i.gyazo.com/4eb6c93862c2bfd25d89e9208da579b2.jpg)](https://gyazo.com/4eb6c93862c2bfd25d89e9208da579b2)

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/a56a6d276aac6a85d68b156c8cf9469f.png)](https://gyazo.com/a56a6d276aac6a85d68b156c8cf9469f)

