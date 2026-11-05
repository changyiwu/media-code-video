#!/usr/bin/env sh
# 把兩個參考 repo 抓到 vendor/（不進 git）。換電腦或要更新上游時執行：
#   sh tools/vendor.sh          # 沒抓過就抓，抓過就更新到上游最新
# Windows 用 Git Bash 執行。
#
# lemo-opuscar 只取文字與程式：不取 .jpg 樣片靜幀（約 88 MB，CC BY 4.0），
# 也不取上游的 AGENTS.md、CLAUDE.md、SKILL.md、plugin/——它們會蓋過本專案的流程。
set -eu

ROOT=$(cd "$(dirname "$0")/.." && pwd)
VENDOR="$ROOT/vendor"
mkdir -p "$VENDOR"

fetch() {  # fetch <名稱> <網址> <sparse 規則（可空）>
  name=$1; url=$2; rules=$3
  dir="$VENDOR/$name"
  if [ ! -d "$dir/.git" ]; then
    if [ -n "$rules" ]; then
      git clone --depth 1 --filter=blob:none --no-checkout "$url" "$dir"
      git -C "$dir" sparse-checkout init --no-cone
      printf '%s\n' "$rules" > "$dir/.git/info/sparse-checkout"
      git -C "$dir" checkout
    else
      git clone --depth 1 "$url" "$dir"
    fi
  else
    git -C "$dir" pull --depth 1 --ff-only
  fi
  echo "$name @ $(git -C "$dir" log -1 --format='%h %cs')"
}

fetch lemo-opuscar https://github.com/lemomo-ai/lemo-opuscar.git '/*
!*.jpg
!/AGENTS.md
!/CLAUDE.md
!**/SKILL.md
!/.claude-plugin/
!/plugin/'

fetch awesome-opus5-5-videos https://github.com/yihui-dev/awesome-opus5-5-videos.git ''
