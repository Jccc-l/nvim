#!/bin/bash

# 定义需要替换的绝对路径前缀和目标变量
REAL_PREFIX="/home/jccc"
REPLACE_VAR='$HOME'  # 使用单引号，防止被 shell 提前解析

echo "正在为当前目录及子目录下的 lua 文件添加注释..."
echo "----------------------------------------"

# 递归查找当前目录及子目录下所有的 .lua 文件
find . -type f -name "*.lua" | while read -r file; do
    # 1. 使用 realpath 获取文件的真实绝对路径
    absolute_path=$(realpath "$file")
    
    # 2. 将绝对路径中的 /home/jccc 替换为 $HOME
    # 使用 Bash 的字符串替换语法，注意转义 $ 以确保输出字面量
    comment_path="${absolute_path//$REAL_PREFIX/$REPLACE_VAR}"
    
    # 拼接完整的注释内容
    full_comment="-- $comment_path"
    
    # 3. 检查文件的第一行是否已经存在该注释，避免重复添加
    first_line=$(head -n 1 "$file")
    if [[ "$first_line" == "-- $REPLACE_VAR"* ]]; then
        echo "跳过 (已存在注释): $absolute_path"
        continue
    fi
    
    # 4. 使用临时文件安全地将注释插入到文件最开头
    temp_file=$(mktemp)
    echo "$full_comment" > "$temp_file"
    cat "$file" >> "$temp_file"
    mv "$temp_file" "$file"
    
    echo "已添加: $absolute_path"
done

echo "----------------------------------------"
echo "处理完成！"
