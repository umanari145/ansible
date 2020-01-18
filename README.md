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


## 実行コマンド(通常は鍵認証)
例えばstart.ymlのみを実行させたい時、
```
ansible-playbook -i hostfile start.yml
```

パスワード認証<br>
別途 sshpassが必要 `brew install http://git.io/sshpass.rb`が必要

```
ansible-playbook -i hostfile start.yml  -u(ユーザー名) -k
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
