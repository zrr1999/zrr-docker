#!/bin/bash

# 检查文件夹路径是否提供
if [ -z "$1" ]; then
    echo "请提供文件夹路径作为参数"
    exit 1
fi

# 检查文件夹路径是否存在
if [ ! -d "$1" ]; then
    echo "文件夹不存在"
    exit 1
fi

# 切换到目标文件夹路径
cd "$1"

# 遍历所有子文件夹
for folder in */; do
    cd "$folder"

    # 检查是否存在docker-compose.yml文件
    if [ -f docker-compose.yml ]; then
        # 运行docker-compose up
        echo "启动 $folder 下的 docker-compose..."
        docker compose up -d --remove-orphans
    else
        echo "$folder 中未找到 docker-compose 文件"
    fi

    cd ..
done

echo "所有docker-compose文件已经启动"
