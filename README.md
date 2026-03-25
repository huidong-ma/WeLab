# WeLab: Mobile Server Monitoring Assistant Powered by WeChat and OpenClaw
WeLab 通过深度整合微信移动端插件与 OpenClaw，配合本地化部署的 Ollama 大模型，将用户的手机微信转化为随时随地的服务器监控终端。无需登录 SSH，用户只需在微信中发送自然语言请求，即可实时查询集群任务状态（如 Slurm 队列）、监控 GPU 显存与节点资源，并安全地执行指定白名单内的终端指令。WeLab 实现了私密、安全且极简的零门槛服务器移动端管控体验。

# Function
- [x] 微信移动端与服务器简单交互，例如查询任务列表、执行命令等。
- [x] 实验进程监控，可主动向移动端发送通知。须在命令最后加入 `analyze <xxx>.log` 命令。

<div align="center">
  <img src="https://github.com/huidong-ma/WeLab/img.png" width="600" alt="An example.">
</div>

# Setup
**Note**: 由于本人实验环境为搭载了 Slurm 系统的集。LLM 采用的是 `ollama: qwen3:8b`，也可调用 API，具体配置可根据平台自行调配。
### I. Environment
```
git clone https://github.com/huidong-ma/WeLab
conda create -n claw_env python=3.10 nodejs=22
conda activate claw_env
chmod +x WeLab tools/analyze tools/notify
```
### II. Ollama
```
wget https://github.com/ollama/ollama/releases/download/v0.18.2/ollama-linux-arm64.tar.zst
tar -I zstd -xvf ollama-linux-amd64.tar.zst
export PATH=/xxx/ollama/bin:$PATH
ollama serve
ollama pull qwen3:8b
```
### III. Openclaw
1. Install openclaw
```
npm install -g openclaw@latest
```
2. Set model
```
openclaw onboard --non-interactive \
  --auth-choice ollama \
  --custom-base-url "http://127.0.0.1:11434" \
  --custom-model-id "qwen3:8b" \
  --accept-risk
```
3. Install Plugin & Scan QR code
```
npx -y @tencent-weixin/openclaw-weixin-cli@latest install
```
### IV. Start
1. Fix `config.json` in `./WeLab`.
2. `bash ollama.sh` & `bash openclaw.sh`
3. Send messages to ClawBot to test.
