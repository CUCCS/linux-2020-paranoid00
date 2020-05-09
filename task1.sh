#!usr/bin/env bash

function help {
    echo "doc"
    echo "q Q                 对jpeg格式图片进行图片质量因子为Q的压缩"
    echo "r R                 对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩成R分辨率"
    echo "w something            对图片批量添加自定义文本水印"
    echo "re1 text            统一添加文件名前缀，不影响原始文件扩展名"
    echo "re2 text            统一添加文件名后缀，不影响原始文件扩展名"
    echo "c                   将png/svg图片统一转换为jpg格式图片"
    echo "h                   帮助文档"
}


#对JPEG格式图片进行图片质量压缩
function QualityCompress(){
	Q=$1
	for i in *;do
		type=${i##*.} 
		if [[ ${type} != "jpeg" ]]; then continue; fi;
		convert "${i}" -quality "${Q}" "${i}"
		echo "${i} is compressed."
	done

}


#对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率
function ResolutionCompression(){
	R=$1
	for i in *;do
		 type=${i##*.}
       		 if [[ ${type} != "jpeg" && ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
		convert "${i}" -resize "${R}" "${i}"
		echo "${i} is resized"
	done

}


#对图片批量添加自定义文本水印
function TEXTWATERMARK(){
	for i in *;do
		convert "${i}" -pointsize "$1" -fill black -gravity center -draw "text 10,10 '$2'" "${i}"
		echo "${i} is watermarked with finish."
	done
}

#批量重命名（统一添加文件名前缀或后缀，不影响原始文件扩展名）
function rename(){
	for i in *;do
		type=${i##*.}
        	if [[ ${type} != "jpeg" && ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
		mv "${i}" "$1""${i}"
		echo "${i} is renamed to $1${i}."
	done
}
function rename2(){
	for i in *;do
		type=${i##*.}
        	if [[ ${type} != "jpeg" && ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
		filename2=${i%.*}$1"."${type}
		mv "${i}" "${filename2}"
		echo "${i} is renamed to ${filename2}"
	done
}

#将png/svg图片统一转换为jpg格式图片
function change(){
	for i in *;do
		type=${i##*.}
       		 if [[ ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
		filename=${i%.*}".jpg"
		convert "${i}" "${filename}"
		echo "finished!"
	done
}


while [ "$1" != "" ];do
	case "$1" in 
		"q")
			QualityCompress "$2"
			exit 0
			;;
		"r")
			ResolutionCompression "$2"
			exit 0
			;;
		"w")
			TEXTWATERMARK "$2" "$3"
			exit 0
			;;
		"re1")
			rename "$2"
			exit 0
			;;
		"re2")
			rename2 "$2"
			exit 0
			;;
		"c")
			change
			exit 0
			;;
		"h")
			help
			exit 0
			;;
	esac
done

