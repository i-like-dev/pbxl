FROM alpine:3.18

# 安裝基本的系統依賴、Asterisk 及其相關工具
RUN apk add --no-cache \
    asterisk \
    asterisk-sample-config \
    asterisk-sounds-moh \
    asterisk-lang-zh_cn \
    bash \
    curl \
    tzdata

# 設定時區為台北時間
ENV TZ=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 開放 Asterisk 常用的 SIP (5060/udp) 與網頁或控制埠
EXPOSE 5060/udp 5060/tcp 8088/tcp

# 啟動 Asterisk 服務（以前景模式運行以配合容器生命週期）
CMD ["/usr/sbin/asterisk", "-f", "-vvv"]
