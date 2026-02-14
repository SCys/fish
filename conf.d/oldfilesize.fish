function oldfilesize -d "計算指定目錄中多少天前的檔案總占用空間（單位：GiB / MB）"
    set -l days 90
    set -l paths

    # 解析參數：第一個如果是純數字 → 當作天數
    if test (count $argv) -ge 1
        if string match -qr '^[0-9]+$' $argv[1]
            set days $argv[1]
            set paths $argv[2..-1]
        else
            set paths $argv
        end
    end

    # 沒有提供路徑 → 用當前目錄
    if test (count $paths) -eq 0
        set paths .
    end

    for dir in $paths
        if not test -d "$dir"
            echo "錯誤：'$dir' 不是目錄或不存在" >&2
            continue
        end

        set -l realpath (realpath "$dir")
        echo "目錄：$realpath"
        echo "條件：修改時間超過 $days 天前"
        echo "----------------------------------------"

        set -l result (find "$dir" -type f -mtime "+$days" -exec du -b {} + 2>/dev/null |
            awk '
                {total += $1; count++}
                END {
                    if (count == 0) {
                        print "沒有找到符合條件的檔案"
                    } else {
                        printf "找到 %d 個檔案  總大小 %.2f GiB  (約 %d MB)\n", 
                               count, total/1024/1024/1024, total/1024/1024
                    }
                }
            ')

        echo "$result"
        echo ""
    end
end
