# コマンドが含まれているパッケージを知りたいとき
dpkg -S /usr/bin/tac

# auth.logに記述されているデーモンを取り出す
cat /var/log/auth.log | awk '{print $5}' | sed s/[:[].*// | sort | uniq -c
cat /var/log/auth.log | perl -anle 'print "$F[4]"' | sed s/[:[].*// | sort | uniq -c

# echoのヘルプをページャを用いて読みたいとき
/usr/bin/echo --help |& less
