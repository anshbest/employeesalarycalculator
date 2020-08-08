#!/bin/bash

IS_PART_TIME=1
IS_FULL_TIME=2
MAX_HRS_IN_MONTH=100
NUM_WORKING_DAYS=20
EMP_RATE_PER_HR=20
NUM_WORKING_DAYS=20

totalWorkHours=0
totalWorkingDays=0

function getWorkingHours(){
	case $1 in
		$IS_FULL_TIME)
			workHours=8
			;;
		$IS_PART_TIME)
			workHours=4
			;;
		*)
		workHours=0
			;;
	esac
	echo $workHours
}

function calcDailyWage(){
	local workHours=$1
	wage=$(($workHours*$EMP_RATE_PER_HR))
	echo $wage
}

while [[ $totalWorkHours -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $NUM_WORKING_DAYS ]]
do
	((totalWorkingDays++))
	workHours="$( getWorkingHours $((RANDOM%3)) )"
	totalWorkHours=$(($totalWorkHours+$workHours))
	empDailyWage["Day""$totalWorkingDays"]="$( calcDailyWage $workHours )"
done

totalSalary=$(($totalWorkHours*$EMP_RATE_PER_HR))
echo "Daily Wage " ${empDailyWage[@]}
