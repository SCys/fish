function towebp --description '将当前目录所有 JPG/JPEG/PNG 转为 WebP（ImageMagick）'
    set -l count 0

    for f in *.{jpg,jpeg,png}
        if test -f "$f"
            # 用 Fish 原生 path 命令生成输出文件名（支持多点文件名，如 file.tar.png → file.tar.webp）
            set output (path change-extension webp "$f")

            echo "✓ 正在转换: $f → $output"
            convert "$f" "$output"

            set count (math $count + 1)
        end
    end

    if test $count -eq 0
        echo "⚠️  当前目录没有找到 JPG/JPEG/PNG 文件"
    else
        echo "🎉 完成！共转换 $count 张图片为 WebP 格式"
    end
end
