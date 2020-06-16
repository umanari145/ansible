# ansible
ansible recipe

## ansibleインストール

**CentOS**
```
yum install epel-release
yum -y install ansible
```
**Mac**
<br>
```
brew install ansible
```


## 実行コマンド

単純な一通りのインストールだけならリモートではなく、<br>
サーバーに直にログインして、下記コマンド群を実行した方が良い

その場合、hostfileのtargetは127.0.0.1になる

例えばstart.ymlのみを実行させたい時、
```
ansible-playbook -i hostfile start.yml
```

パスワード認証<br>
別途 sshpassが必要 `brew install http://git.io/sshpass.rb`が必要

リモートの場合
```
ansible-playbook -i hostfile start.yml  -u matsumoto(ユーザー名) -k(パスワードを尋ねるオプション)
ansible-playbook -i hostfile --user=matsumoto(SSHログイン時のユーザー) --private-key=(秘密鍵のパス) start.yml
```

特定のtagのみを実行させたい時
```
ansible-playbook -i hostfile start.yml --tags "basic"
ansible-playbook -i hostfile php.yml --tags "composer,mysql"
```

特定のtagのみを実行させたくない時
```
ansible-playbook -i hostfile start.yml --skip-tags "basic"
```
実際によく使うパターン
```
 ansible-playbook -i hostfile --user=ec2-user --private-key=(AWSの鍵パス)  aws_start.yml --tags "aws_repo"
```

ローカルへのインストール hostfileのtargetは127.0.0.1を記述
```
ansible-playbook -i hostfile --connection=local  start.yml --tags "basic"
```

### Docker + ansible
Dockerをansibleで作る<br>
https://qiita.com/soichiro0311/items/5d5fb00d03c4bba994eb<br>
ansibleファイルを同階層におくことでコンテナ内へのログインの手間が省ける


### hostfile
ターゲットサーバーのIP
自分自身は127.0.0.1

### ロール(role下)

- alias  `rm → rm -i`など基本コマンドの読み込み
- basic 全サーバーに共通のライブラリ、リポジトリ
- bower
- cakePHP cake3 template:config系ファイル var:ディレクトリやDB情報
- composer
- cpan WMS用のcpan
- cron DBバックアップや監視ログ系の処理全般のcron
- git yumでなく最新版のgit var:gitのユーザー情報
- logrotate iotop,ps,wmslogなどのrotate
- mysql yum標準のmysqlインストール+設定ファイル更新 DB作成まで(`etc/my.cnf`) var:ユーザー情報など
- mysql57 5.7のインストール+設定ファイル更新(`etc/my.cnf`) `mysql_shell.sh`はパスワード出力のシェル varはDBパス
- nginx nginx+php-fpm 予約システム用あり var:host名とディレクトリなど
- npm node+npm var:versionなど
- npt 標準時に時間を合わせる処理
- perl perl基本ライブラリ＋fcgiwrap
- php7 remi+php7+設定ファイル(`php.ini`)更新
- php56 remi+php5.6
- phpenv
- port http+mysql+sshの解放
- ruby
- serverspec 実装途中・・・
- ssh ポート2222,パスワードログイン禁止、ルートログイン禁止、ユーザー限定
- useradd ユーザー追加とsudoファイル更新 varユーザーとパスワード情報
- vim vimの基本設定
- zabbix

### 頻出グループ
- start.yml 超基本形
- common.yml サーバー監視系
- php.yml
- node.yml
- mysql.yml
- ruby.yml
