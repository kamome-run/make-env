#!/bin/sh -eu

# アップデートとアップグレード\
sudo apt update -y && sudo apt upgrade -y
echo "アップデートとアップグレードに成功しました"

# カレントディレクトリを取得
currentDir=$(pwd)
# カレントディレクトリが/home/yusuke_oyama134553241であるかどうかの確認
if [[ "$currentDir" = "/home/yusuke_oyama134553241" ]]; then
    echo "カレントディレクトリは/home/yusuke_oyama134553241です"
else
    echo -e "カレントディレクトリは/home/yusuke_oyama134553241ではありません\nカレントディレクトリを移動します"
    cd
    echo "カレントディレクトリを/home/yusuke_oyama134553241に移動しました"
fi

# JavaScriptの学習用ディレクトリを作成し、その中に入る
if [[ -d "/home/yusuke_oyama134553241/studyJS" ]]; then
    echo "studyJSは既に存在します"
else
    echo "JavaScriptの学習用ディレクトリstudyJSを作成します"
    mkdir studyJS
    echo "studyJSディレクトリを作成しました"
fi

cd studyJS
echo "studyJSの中に入りました"

# Node.jsをインストールし、バージョンを確認
if command -v node > /dev/null 2>&1; then
    echo -e "Node.jsは既にインストールされています\nバージョンは$(node -v)です"
else
    echo -e "Node.jsはインストールされていません\nNode.jsをインストールします"
    sudo apt install -y nodejs

    if ! sudo apt install -y nodejs; then
        echo "Node.jsのインストールに失敗しました"
        exit 1
fi

echo -e "Node.jsをインストールしました\nバージョンは$(node -v)です"
fi

# canvasをインストール
echo "canvasをインストールします"
# 依存関係のインストール
sudo apt install -y build-essential python3 libpixman-1-dev libpango1.0-dev libcairo2-dev libgif-dev libjpeg-dev libgif-dev librsvg2-dev
echo "canvasの依存関係のインストールに成功しました"
# canvasをインストール
npm install canvas
echo "canvasのインストールに成功しました"

# npmのキャッシュを掃除する
npm cache verify
echo "npmのキャッシュを削除しました"