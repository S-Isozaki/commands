# あるセクションに存在するマニュアルをすべて取得する
apropos --section=2 .

# 6000行以上ある出力の先頭30行のみ
sudo modprobe -c | awk '{if($1=="alias")print $0}' | sed -n 1,30p
sudo modprobe -c | awk '{if($1=="alias")print $0}' | head -30
sudo modprobe -c | grep ^alias | head -30
sudo modprobe -c | grep --max-count=30 ^alias
sudo modprobe -c | grep -m 30 ^alias

# スペース区切りの表の3列目のみ集計
sudo modprobe -c | cut -d ' ' -f 3 | sort | uniq -c

# サブシェルで実行することでunset等をする必要がなくなる
(w=('one' 'two' 'three'); IFS=-; echo "${w[*]}")

# 最終行を削除
sed -i '$d' /etc/sshd/sshd_config

# sha256ハッシュ値の検証
diff <(sha256sum /home/user/nvim.appimage) <(echo "0d0802f2db7d0d3c6573047f59211b5aa5b3440f60cc364cc291cd2dc71203a3")

# シンボリックリンク
sudo ln -s /home/user/squashfs-root/usr/bin/nvim /usr/bin/nvim

# コンテキストの1番目と2番目のみ削除
kubectl config get-contexts -o name | for i in {1..3}; do read x; if [[ $i == "1" || $i == "2" ]]; then kubectl config delete-context $x ; fi; done

# minikubeクラスタを残して他をすべて削除
kubectl config get-clusters | for i in {1..4}; do read x; if [[ $x != "minikube" && $x != "NAME" ]]; then kubectl config delete-cluster $x ; fi; done

# 静的コード解析
echo 'kubectl config get-clusters | while read x; do if [[ $x != "minikube" && $x != "NAME" ]]; then kubectl config delete-cluster $x ; fi; done' | bash -n
