#!/usr/bin/env bash

# ========================
# Git + SSH 初始化脚本
# ========================

# 设定用户信息
read -p "请输入你的 Git 用户名: " GIT_NAME
read -p "请输入你的 Git 邮箱: " GIT_EMAIL

git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

echo "✅ Git 用户信息已设置：$GIT_NAME <$GIT_EMAIL>"

# 检查 ~/.ssh 目录
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# 判断是否已存在 SSH Key
KEY_PATH="$HOME/.ssh/id_rsa"

if [[ -f "$KEY_PATH" ]]; then
  echo "✅ SSH 密钥已存在：$KEY_PATH"
else
  echo "🔐 生成新的 SSH Key..."
  ssh-keygen -t rsa -b 4096 -C "$GIT_EMAIL" -f "$KEY_PATH" -N ""
fi

# 启动 ssh-agent 并添加私钥
eval "$(ssh-agent -s)"
ssh-add "$KEY_PATH"

# 显示公钥内容
echo "📋 请将以下公钥复制到 GitHub： https://github.com/settings/keys"
echo "------------------------------------------------"
cat "$KEY_PATH.pub"
echo "------------------------------------------------"

# 测试连接 GitHub
echo "🚀 你可以运行以下命令测试 SSH 是否连接成功："
echo "ssh -T git@github.com"

# 可选：自动设置当前目录的远程地址为 SSH
if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  CURRENT_REMOTE=$(git remote get-url origin 2>/dev/null)
  if [[ "$CURRENT_REMOTE" == https://github.com/* ]]; then
    SSH_URL=$(echo "$CURRENT_REMOTE" | sed 's_https://github.com/_git@github.com:_')
    git remote set-url origin "$SSH_URL"
    echo "🔁 已将远程地址更换为 SSH：$SSH_URL"
  fi
fi

echo "✅ 全部完成！现在你可以愉快地使用 Git + SSH 与 GitHub 同步了。"
