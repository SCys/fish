if command -sq ffmpeg
    alias ff_probe 'ffprobe -hide_banner -i '
    #alias ff_convert "ffmpeg -hide_banner -hwaccel cuda -hwaccel_output_format cuda -threads 4 -i $1 -c:v hevc_nvenc -crf 28 -preset medium -c:a aac -b:a 256k $2"
end