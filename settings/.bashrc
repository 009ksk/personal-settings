# ~/.bashrcの最下部に追記して
# source ~/.bashrc
# を実行する

# プロンプトの変更
# 色の設定 (プロンプト用にエスケープシーケンスを囲む)
RESET="\[\e[0m\]"
WHITE="\[\e[37m\]"
GREEN="\[\e[32m\]"
BRIGHT_CYAN="\[\e[96m\]"

# Gitブランチを取得する関数
get_git_branch() {
  # 現在のディレクトリがGitリポジトリかどうかを確認
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    # 現在のブランチ名を取得
    local branch=$(git branch --show-current)
    # エスケープシーケンスで囲んだブランチ名を返す
    # echoすると上で定義した色コードがつかえなくなるので再定義
    YELLOW="\e[33m"
    WHITE="\e[37m"

    echo -e "${WHITE}( ${YELLOW}${branch}${WHITE} )"
  fi
}

# PS1の設定
export PS1="${WHITE}\D{%F %T} ${GREEN}\u@\h ${WHITE}[ ${BRIGHT_CYAN}\W ${WHITE}] \$(get_git_branch)${RESET} \$ "