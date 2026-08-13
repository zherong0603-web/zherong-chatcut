#!/usr/bin/env bash
set -euo pipefail

echo "[1/3] 检查 OpenCLI"
opencli doctor

echo "[2/3] 检查 Agent Reach 的小红书后端"
doctor_json="$(agent-reach doctor --json)"
printf '%s\n' "$doctor_json"
printf '%s\n' "$doctor_json" | grep -q '"xiaohongshu"'
printf '%s\n' "$doctor_json" | grep -A8 '"xiaohongshu"' | grep -q '"status": "ok"'

echo "[3/3] 执行三条结果的只读搜索"
tmp_result="$(mktemp)"
trap 'rm -f "$tmp_result"' EXIT
opencli xiaohongshu search "GPT Live 对话" --limit 3 -f json > "$tmp_result"
python3 - "$tmp_result" <<'PY'
import json, sys

data = json.load(open(sys.argv[1], encoding="utf-8"))
if not data:
    raise SystemExit("只读搜索没有返回结果")
for item in data[:3]:
    print(f"- {item.get('rank')}: {item.get('title')}｜{item.get('author')}｜赞 {item.get('likes')}")
PY

echo "通过：当前电脑可进行小红书只读搜索。"
echo "禁止使用关注、点赞、评论、发布或删除等写操作。"
