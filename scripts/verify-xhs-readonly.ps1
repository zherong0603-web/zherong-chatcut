$ErrorActionPreference = "Stop"

Write-Host "[1/3] 检查 OpenCLI"
opencli doctor

Write-Host "[2/3] 检查 Agent Reach 的小红书后端"
$doctor = agent-reach doctor --json
$doctor | Write-Host
if (($doctor -join "`n") -notmatch '"xiaohongshu"') { throw "未发现小红书后端" }
if (($doctor -join "`n") -notmatch '"status":\s*"ok"') { throw "小红书后端未就绪" }

Write-Host "[3/3] 执行三条结果的只读搜索"
$results = opencli xiaohongshu search "GPT Live 对话" --limit 3 -f json | ConvertFrom-Json
if (-not $results) { throw "只读搜索没有返回结果" }
$results | Select-Object -First 3 | ForEach-Object {
  Write-Host ("- {0}: {1}｜{2}｜赞 {3}" -f $_.rank, $_.title, $_.author, $_.likes)
}

Write-Host "通过：当前电脑可进行小红书只读搜索。"
Write-Host "禁止使用关注、点赞、评论、发布或删除等写操作。"
