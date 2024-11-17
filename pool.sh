# あるコマンドがどのパッケージに含まれているかを知りたいとき
dpkg -S /usr/bin/tac

# auth.logに記述されているコマンドを集計する
# cat /var/log/auth.log | awk '{print $5}' | sed s/[:[].*// | sort | uniq -c
# cat /var/log/auth.log | perl -anle 'print "$F[4]"' | sed s/[:[].*// | sort | uniq -c

# echoのヘルプをページャを用いて読みたいとき
/usr/bin/echo --help |& less
eval "$(which echo) --help" |& less

# EOFをシングルクオーテーションで囲むことで、パラメータの展開を防げる
cat <<'EOF' > input.txt
echo "$0"
EOF

# 番号が連続しているtmuxのセッションを削除する
for i in {0..3}; do tmux kill-session -t $i; done

# HISTCONTROLの値がignorebothかignorespaceになっている時は、コマンドの先頭にスペースを挿入することでそのコマンドが履歴に残らなくなる
 echo $HISTCONTROL

# 前に入力したコマンドを、履歴をさかのぼって文字列を置換して再実行する
!-3:s/a/b/ # 履歴に残っている中で3つ前のコマンドを再実行する。最初に出てきた文字aをbに変更する
!-3:gs/a/b/ # すべての文字aをbに変更する

# 1行目を除いてソート
kubectl api-resources | awk 'NR == 1; NR > 1{print $0 | "sort"}'

# minikubeという名前のクラスタに関する情報を取得する
kubectl config view -o=jsonpath='{.clusters[?(@.name=="minikube")]}'

# json形式でデータを取得してそのままvimで閲覧したいとき
vim <(kubectl get -o=json pods) # :set ft=json 等を行うと見やすくなる

# 先頭行以外をソート(これは2つ目のカラムについて数値順)
{ echo 100000 100000; for i in {1..10}; do echo $RANDOM $RANDOM; done; } | awk 'NR==1; NR>1{print $0 | sort -n -k 2}'

# apt show の説明文に出てきたURLを持つサイトのHTMLを取得する
curl -L `apt-cache show exim4-base | grep http://w | sed -e s/ // -e s/. .*// | uniq`

# sedで特定の行だけ文字列の置換をしたのち出力する
sed '3{s/^DIMENSION: //;p}' input_file # ;で分ける

