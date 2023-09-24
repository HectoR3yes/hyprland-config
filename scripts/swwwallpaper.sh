#!/usr/bin/env sh

# define functions

Wall_Update()
{
    local x_wall=$1
    ln -fs $x_wall $wallSet
}

Wall_Change()
{
    local x_switch=$1

    for (( i=0 ; i<${#Wallist[@]} ; i++ ))
    do
        if [ ${Wallist[i]} == ${fullPath} ] ; then

            if [ $x_switch == 'n' ] ; then
                nextIndex=$(( (i + 1) % ${#Wallist[@]} ))
            elif [ $x_switch == 'p' ] ; then
                nextIndex=$(( i - 1 ))
            fi

            Wall_Update ${Wallist[nextIndex]}
            break
        fi
    done
}

Wall_Set()
{
    if [ -z $xtrans ] ; then
        xtrans="grow"
    fi

    swww img $wallSet \
    --transition-bezier .43,1.19,1,.4 \
    --transition-type $xtrans \
    --transition-duration 0.7 \
    --transition-fps 120 \
    --invert-y \
    --transition-pos "$( hyprctl cursorpos )"
}


# set variables

wallSet="$HOME/.config/hypr/scripts/wall.set"
fullPath=`echo $(swww query | head -n 1 | cut -d ":" -f5 | xargs)`
fullPath=`eval echo $fullPath`
wallName=`echo $fullPath | awk -F '/' '{print $NF}'`
wallPath=`echo $fullPath | sed "s/\/$wallName//g"`

Wallist=(`ls $wallPath/*`)


# evaluate options

while getopts "nps" option ; do
    case $option in
    n ) # set next wallpaper
        xtrans="grow"
        Wall_Change n ;;
    p ) # set previous wallpaper
        xtrans="outer"
        Wall_Change p ;;
    s ) # set input wallpaper
        shift $((OPTIND -1))
        if [ -f $1 ] ; then
            Wall_Update $1
        fi ;;
    * ) # invalid option
        echo "n : set next wall"
        echo "p : set previous wall"
        echo "s : set input wallpaper"
        exit 1 ;;
    esac
done


# check swww daemon and set wall

swww query
if [ $? -eq 1 ] ; then
    swww init
fi

Wall_Set


