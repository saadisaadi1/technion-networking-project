#!/bin/bash
CLIENTS_LIST=(10 20 30 40 50 60 70 80 90 100 110 120 300 500 1000)
RNGRUN=10
PATHARRAY=(N10 N20 N30 N40 N50 N60 N70 N80 N90 N100 N110 N120 N130 N140 N150)
PATHPOS=0

for NUMCLIENTS in "${CLIENTS_LIST[@]}"
do
    echo $NUMCLIENTS Clients:

    if [ $NUMCLIENTS -eq 300 ]; then
        PATHPOS=12  # Set PATHPOS to the index for N130
    elif [ $NUMCLIENTS -eq 500 ]; then
        PATHPOS=13  # Set PATHPOS to the index for N140
    elif [ $NUMCLIENTS -eq 1000 ]; then
        PATHPOS=14  # Set PATHPOS to the index for N150
    fi

    for filename in log1.txt log2.txt log3.txt log4.txt log5.txt log6.txt log7.txt log8.txt log9.txt log10.txt log11.txt log12.txt log13.txt log14.txt log15.txt log16.txt log17.txt log18.txt log19.txt log20.txt log21.txt log22.txt log23.txt log24.txt log25.txt log26.txt log27.txt log28.txt log29.txt log30.txt
    do
        echo -- Run $RNGRUN ...

        ./waf --run "scratch/nonQos --numSta=$NUMCLIENTS --numClients=$NUMCLIENTS --myRngRun=$RNGRUN" > "$filename" 2>&1

        cp "$filename" "/home/student/NS3-802.11g-Backoff-main/ns-allinone-3.25/ns-3.25/Data/${PATHARRAY[$PATHPOS]}"

        let "RNGRUN++"
    done

    let "PATHPOS++"
    rm *.pcap
done
