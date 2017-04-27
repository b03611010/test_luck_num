#!/bin/bash
NUM=$1

NUM=`echo $NUM | sed 's/^0//'`

if [ $NUM -le "999" ] 
then
	MULT=$(($NUM / 80))
	METH1=$(($NUM - $MULT*80))
	
	HUND=$(($NUM/100))
	TENS=$((($NUM - $HUND*100)/10))
	DIGT=$((($NUM - $HUND*100)%10))
	METH2=$(($HUND + $TENS + $DIGT))
else
	MULT=$(($NUM / 80))
	METH1=$(($NUM - $MULT*80))

	TUND=$(($NUM /1000))
	HUND=$((($NUM - $TUND*1000)/100))
	TENS=$((($NUM - $TUND*1000 - $HUND*100)/10))
	DIGT=$((($NUM - $TUND*1000 - $HUND*100)%10))
	METH2=$(($TUND + $HUND + $TENS + $DIGT))
fi

RESU1=`sqlite3 test_luck.db "select * from test_luck_ornot where ID="$METH1""`
RESU2=`sqlite3 test_luck.db "select * from test_luck_ornot where ID="$METH2""`

echo $RESU1
echo $RESU2
