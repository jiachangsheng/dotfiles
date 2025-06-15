# 清除旧 SSH
rm -rf ~/.ssh

# 生成新密钥
ssh-keygen -t ed25519 -C "your_email@example.com"

# 启动 SSH agent 并添加密钥(以管理员方式运行命令)
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# 配置 SSH
echo -e "Host github.com\n  HostName github.com\n  User git\n  IdentityFile ~/.ssh/id_ed25519\n  IdentitiesOnly yes" > ~/.ssh/config

# 显示公钥用于添加到 GitHub
cat ~/.ssh/id_ed25519.pub

# 测试连接
ssh -T git@github.com

# 推送
git push

