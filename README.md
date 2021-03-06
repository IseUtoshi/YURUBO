# README

## アプリケーション名: YURUBO

## 概要
「YURUBO」は、主にオンラインゲームのマルチプレイにおいて、一緒にプレイする人を「ゆるく」募集できるアプリです。自分の予定を記入しておくことで、それを見た友人知人と一緒に遊ぶことができます。逆に、予定を記入してくれた人とは、自分の都合が合う範囲で遊ぶことができます。相手を指定せずプレイヤーの募集ができ、それに予定の合う人が参加できる、そんなゆるいつながりを作ることを目的としています。

## URL
https://yurubo-uc.herokuapp.com/

## テスト用アカウント
Basic認証
ID:admin  
Pass:14627  
管理者(一般ユーザーに加え、デフォルト表示のゲームリストの追加ができます)
(name:admin)
mail:admin@a.com
pass:admin55555

一般ユーザー1
(name:user1)
mail:user1@u.com
pass:user1111

一般ユーザー2
(name:user2)
mail:user2@u.com
pass:user2222

## 利用方法
・初めに新規登録またはログインを行ってください。  
・自分の予定を投稿する場合は、トップページより日付を選び、詳細ページより投稿ページに進んでください。  
・ユーザーの投稿を見る場合は、トップページより日付を選び、詳細ページより確認してください。  
・フォローの有無により、表示される投稿が異なります。  
・ユーザーをフォローしたいときは、そのユーザーのユーザーページからフォローしてください。(マイページ→フォロー一覧ページよりユーザーを検索できます)  
・投稿の編集・削除は、マイページから可能です。  

## 作成背景
自分がマルチプレイのゲームをするとき、ランダムな相手とやるのも楽しいのですが、友人知人とやれたらもっと楽しいのに、と思うことがあります。ただ、急に誘うのも迷惑ですし、都合が合わなかった場合に断ることになるので気を遣わせてしまいます。そこで、お互いに気負わずマルチプレイを楽しめるツールとして、このアプリを作成いたしました。同じような気持ちを抱える人に、利用していただければ幸いに思います。

## 要件定義
下記リンクを参照ください。
https://docs.google.com/spreadsheets/d/1fPadBrGmfU6cizKgkI3PzrZDct7D1N6VVFTwmCFOtN0/edit#gid=982722306

## 実装機能


## 実装予定の機能
・通知機能(可能であればスマホアプリ)  
・コメント機能(ユーザーページに実装)  
・カスタム機能(投稿内容の事前設定、通知可否、コメント可否)  
・ブロック機能

## データベース設計(最終的な実装イメージ)
[![Image from Gyazo](https://i.gyazo.com/a23140b3bcce7465bdef97ee7e3823ce.png)](https://gyazo.com/a23140b3bcce7465bdef97ee7e3823ce)
## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/313baf69e3a7ab25df1de3cedb23c5fe.png)](https://gyazo.com/313baf69e3a7ab25df1de3cedb23c5fe)
## 開発環境
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code

## ローカルでの動作方法
以下のコマンドを順番に入力してください。  
% git clone https://git.heroku.com/yurubo-uc.git  
% cd yurubo-uc  
% bundle install  
% yarn install

## 制作時の工夫点



