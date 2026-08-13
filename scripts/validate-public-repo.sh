#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo_root"

required=(
  "README.md"
  "LICENSE"
  "skills/zherong-chatcut/SKILL.md"
  "skills/zherong-chatcut/agents/openai.yaml"
  "skills/zherong-chatcut/references/current-topic-radar.md"
)

for file in "${required[@]}"; do
  test -f "$file" || { echo "缺少必需文件：$file"; exit 1; }
done

grep -q '^name: zherong-chatcut$' skills/zherong-chatcut/SKILL.md
grep -q '\$zherong-chatcut' README.md

if rg -n --hidden --glob '!.git/**' --glob '!scripts/validate-public-repo.sh' \
  '(xsec_token|Authorization:[[:space:]]*Bearer|gho_[A-Za-z0-9]+|github_pat_[A-Za-z0-9_]+|/Users/[^/]+/|app\.chatcut\.io/.{0,30}[0-9a-f]{8}-[0-9a-f-]{27}|Project ID:.*[0-9a-f]{8}-[0-9a-f-]{27})' .; then
  echo "失败：发现可能的凭据、本机绝对路径或真实 ChatCut 项目标识。"
  exit 1
fi

if rg -n --hidden --glob '!.git/**' --glob '!scripts/validate-public-repo.sh' \
  '(create-chatcut-dialogue-shorts|xiaoli-content-growth|私有仓库)' .; then
  echo "失败：发现旧 Skill 名或私库依赖。"
  exit 1
fi

echo "通过：公开仓库结构、唯一 Skill 名和敏感模式检查均正常。"
