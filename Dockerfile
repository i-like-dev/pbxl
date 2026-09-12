# 使用目前開源社群維護最新、最穩定的 FreePBX 17 + Asterisk 21 現代介面映像檔
FROM tirans/freepbx:17

# 設定環境變數（預設啟用防暴力破解與繁體中文介面）
ENV ENABLE_FAIL2BAN=true \
    ADMIN_LANGUAGE=zh_TW

# 暴露雲端總機必要的核心連接埠
# 80: 網頁管理後台 | 5060: SIP話機註冊埠 | 10000-10020: RTP語音串流通道
EXPOSE 80/tcp 5060/udp 10000-10020/udp

# 保持映像檔預設的啟動入口點
ENTRYPOINT ["/entrypoint.sh"]
