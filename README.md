# ansible
ansible recipe

## ansibleインストール

** CentOS **
```
yum install epel-release
yum -y install ansible
```
** Mac **
<br>
```
brew install ansible
```

## 変数ファイル
vars/hostlist
```
cp -ipr vars/hostlist.sample vars/hostlist
```

## 実行コマンド
例えばstart.ymlのみを実行させたい時、
```
ansible-playbook -i hostlist start.yml
```

特定のtagのみを実行させたい時
```
ansible-playbook -i hostlist start.yml --tags "basic"
```

特定のtagのみを実行させたくない時
```
ansible-playbook -i hostlist start.yml --skip-tags "basic"
```
