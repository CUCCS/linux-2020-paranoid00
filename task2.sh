#!/usr/bin/env bash

function help(){
    echo "doc"
    echo "s                 统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比"
    echo "p                 统计不同场上位置的球员数量、百分比"
    echo "n                 名字最长的球员是谁？名字最短的球员是谁？"
    echo "a                 年龄最大的球员是谁？年龄最小的球员是谁？"
    echo "h                 帮助文档"
}
# 统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比
function countAge(){
    age=$(awk -F "\t" 'NR!=1 {print $6}' worldcupplayerinfo.tsv)
    cntlt20=0
    cnt2030=0
    cntgt30=0
    sum=0
    for i in ${age[@]}; do
        if [[ $i -lt 20 ]]; then 
            ((cntlt20++)) 
        elif [[ $i -gt 30 ]]; then
            ((cntgt30++))
        else
            ((cnt2030++))
        fi 
    done
    sum=$((cntlt20 + cnt2030 + cntgt30))
    printf "20岁以下的球员有%d人，占比%f%% \n" $cntlt20 $(echo "$cntlt20/$sum*100" | bc -l | awk '{printf "%f",$0}')
    printf "20到30岁的球员有%d人，占比%f%% \n" $cnt2030 $(echo "$cnt2030/$sum*100" | bc -l | awk '{printf "%f",$0}')
    printf "30岁以上的球员有%d人，占比%f%% \n" $cntgt30 $(echo "$cntgt30/$sum*100" | bc -l | awk '{printf "%f",$0}')
}

# 统计不同场上位置的球员数量、百分比
function countPosition(){
    declare -A poscnt
    sum=0
    pos=$(awk -F "\t" 'NR!=1 {print $5}' worldcupplayerinfo.tsv)
    for i in ${pos[@]}; do 
        ((poscnt[${i}]++))
        ((sum++))
    done
    for key in ${!poscnt[@]}; do
        echo ${sum}
        printf "%s位置的球员有%d人，占比%f%% \n" ${key} ${poscnt[$key]} $(echo "${poscnt[$key]}/$sum*100" | bc -l | awk '{printf "%f",$0}')
    done 
}


#名字最长的球员和名字最长的球员
function maxName(){
    awk -F "\t" '
        BEGIN {mx=-1; mi=1000;}
        $9!="Player" {
            len=length($9);
            names[$9]=len;
            mx=len>mx?len:mx;
            mi=len<mi?len:mi;
        }
        END {
            for(i in names) {
                if(names[i]==mx) {
                    printf("The longest name is %s\n", i);
                } else  if(names[i]==mi) {
                    printf("The shortest name is %s\n", i);
                }
            }
        }' worldcupplayerinfo.tsv
}

#年龄最大的球员和年龄最小的球员
function maxAge(){
    awk -F "\t" '
        BEGIN {mx=-1; mi=1000;}
        NR>1 {
            age=$6;
            names[$9]=age;
            mx=age>mx?age:mx;
            mi=age<mi?age:mi;
        }
        END {
            printf("The oldest age is %d, who is\n", mx);
            for(i in names) {
                if(names[i]==mx) { printf("%s\n", i); }
            }
            printf("The youngest age is %d, who is\n", mi);
            for(i in names) {
                if(names[i]==mi) { printf("%s\n", i); }
            }
        }' worldcupplayerinfo.tsv
}

while [ "$1" != "" ];do
    case "$1" in
        "s")
            countAge
            exit 0
            ;;
        "p")
            countPosition
            exit 0
            ;;
        "n")
            maxName
            exit 0
            ;;
        "a")
            maxAge
            exit 0
            ;;
        "h")
            help
            exit 0
            ;;
    esac
done
