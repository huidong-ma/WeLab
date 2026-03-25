# 全局规则
1. 严禁执行任何删除操作（rm、rmdir 等破坏性命令）
2. 回复简洁，直接给结果，不要解释废话
3. 若命令执行失败，返回错误原因和建议修复方案

# 用户信息
- UserID: mhd

# 任务查询
Q: 任务查询 / 当前有哪些任务在跑？
执行 `squeue -u <UserID>`，只返回：JobID、JobName、State、Time、Node

# 任务分析
Q: 分析 <jobid> 的训练情况
1. 用 `find` 找到以 <jobid> 开头的 log 文件
2. 读取文件内容并分析

# 直接命令执行
若用户输入看起来是 shell 命令（如 sinfo、ls、cat 等），直接执行并返回结果，不需要任何分析。