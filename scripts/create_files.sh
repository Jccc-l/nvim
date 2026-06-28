#!/bin/bash

# 定义 init.lua 的路径
INIT_FILE="$HOME/.config/nvim/lua/plugins/init.lua"
PLUGIN_DIR="$HOME/.config/nvim/lua/plugins"

# 确保目录存在
mkdir -p "$PLUGIN_DIR"

# 检查源文件是否存在
if [ ! -f "$INIT_FILE" ]; then
    echo "错误: 找不到文件 $INIT_FILE"
    exit 1
fi

# 提取 name="xxx" 中的 xxx
plugin_names=$(grep -o 'name = "[^"]*"' "$INIT_FILE" | sed 's/name = "\([^"]*\)"/\1/')

# 循环创建空文件
for name in $plugin_names; do
    file_path="$PLUGIN_DIR/$name.lua"
    
    if [ ! -f "$file_path" ]; then
        touch "$file_path"
        echo "已创建空文件: $file_path"
    else
        echo "跳过 (已存在): $file_path"
    fi
done

echo "完成！所有插件对应的空文件已检查/创建。"
