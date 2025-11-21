#!/bin/bash

# MINIX3 GDB 调试启动脚本
MINIX_ISO="minix_x86.iso"  # 确保这里指向你生成的 ISO 文件

echo "================================================"
echo "Starting MINIX3 in GDB debug mode"
echo "GDB server listening on localhost:1234"
echo "================================================"
echo ""
echo "In another terminal, run:"
echo "  gdb -x minix-gdb.init"
echo ""

qemu-system-i386 \
  -m 512 \
  -cdrom $MINIX_ISO \
  -boot d \
  -s \
  -S \
  -serial stdio \
  -monitor telnet:127.0.0.1:55555,server,nowait

# 参数说明：
# -s          : 在 TCP 端口 1234 上启动 GDB 服务器
# -S          : 启动时暂停 CPU，等待 GDB 连接
# -serial stdio : 将串口输出到终端（可以看到内核日志）
# -monitor    : QEMU 监控接口（可选）

