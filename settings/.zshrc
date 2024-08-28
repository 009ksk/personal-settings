# 色の設定（プロンプト用）
# Gitブランチを取得する関数
get_git_branch() {
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        # 現在のブランチ名を取得
        local branch=$(git branch --show-current)
        # エスケープシーケンスで囲んだブランチ名を返す
        echo "%F{white}( %F{yellow}${branch}%F{white} )"
    else
        echo ""
    fi
}

# precmd関数を定義して、毎回プロンプトの前にブランチを取得
precmd() {
    export PROMPT="%F{white}%D{%Y-%m-%d %H:%M:%S} %F{green}%n@%m %F{white}[ %F{cyan}%1~ %F{white}] $(get_git_branch)${RESET} %F{magenta}$%f "
}