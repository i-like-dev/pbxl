# 改用社群目前最新、完美支援 Zeabur 容器架構的 FreePBX 17 + Asterisk 21 映像檔
FROM escomputers/freepbx:latest

# 設定必要的自動化變數（預設啟用防暴力破解）
ENV FAIL2BAN_ENABLE=true

# 暴露雲端總機核心連接埠
EXPOSE 80/tcp 5060/udp 10000-10020/udp
