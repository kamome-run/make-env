#!/bin/sh -eu

# アップデートとアップグレード
sudo apt update -y && sudo apt upgrade -y
echo "アップデートとアップグレードに成功しました"

# カレントディレクトリを取得
currentDir=$(pwd)

# カレントディレクトリがホームディレクトリであるかどうかの確認
if [[ -d "$currentDir" = $HOME ]]; then
    echo "カレントディレクトリはホームディレクトリです"
else
    echo -e "カレントディレクトリはホームディレクトリではありません\nカレントディレクトリを移動します"
    cd
    echo "カレントディレクトリをホームディレクトリに移動しました"
fi

# JavaScriptの学習用ディレクトリを作成し、その中に入る
if [[ ! -d "$HOME/studyJS" ]]; then
    echo "JavaScriptの学習用ディレクトリstudyJSを作成します"
    mkdir "$HOME/studyJS"
    echo "studyJSディレクトリを作成しました"
fi

cd studyJS || { echo "studyJSディレクトリに移動できませんでした"; exit 1; }
echo "studyJSの中に入りました"

# Node.jsをインストールし、バージョンを確認
if command -v node > /dev/null 2>&1; then
    echo -e "Node.jsは既にインストールされています\nバージョンは$(node -v)です"
else
    echo -e "Node.jsはまだインストールされていません\nNode.jsをインストールします"
    sudo apt install -y nodejs

    if [[ $? -ne 0 ]]; then
        echo "Node.jsのインストールに失敗しました"
        exit 1
    fi

    echo -e "Node.jsをインストールしました\nバージョンは$(node -v)です"
fi

# npmをインストールし、バージョンを確認
if command -v npm > /dev/null 2>&1; then
    echo -e "npmは既にインストールされています\nバージョンは$(npm -v)です"
else
    echo -e "npmはまだインストールされていません\nnpmをインストールします"
    sudo apt install -y npm

    if [[ $? -ne 0 ]]; then
        echo "npmのインストールに失敗しました"
        exit 1
    fi

    echo -e "npmをインストールしました\nバージョンは$(npm -v)です"
fi

# Vue.jsの開発環境を構築
if npm list create-vue > /dev/null 2>&1; then
    echo -e "Vue.jsの開発環境は既に構築されています\nバージョンは$(create-vue --version)です"
else
    echo -e "Vue.jsの開発環境はまだ構築されていません\nVue.jsの開発環境を構築します"
    npm create vue@latest

    if [[ $? -ne 0 ]]; then
        echo "Vue.jsの開発環境の構築に失敗しました"
        exit 1
    fi
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

# autoremove
sudo apt autoremove -y