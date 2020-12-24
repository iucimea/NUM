#!/bin/bash    

WORK="$HOME/Work/Project/Part3"

### the following line gives you the name of the pc you are running on
echo ‘Running on ‘ `hostname` 

### the following lines create a temporary directory if it doesn’t exist
TMP_DIR=/tmp/`whoami`
if [ ! -d $TMP_DIR ]; then
mkdir $TMP_DIR ; chmod 775  $TMP_DIR
fi

### change to the temporary directory  
cd $TMP_DIR

### copy input file and pseudopotential from your working to the temporary directory 
cp $WORK/ZnO_slab.in .
cp $WORK/Pseudopotentials/Zn.pbe-van.UPF .
cp $WORK/Pseudopotentials/O.pbe-rrkjus.UPF .


### run pw.x at low priority with ZnO.in as the input and ZnO.out as the output
nice -19  pw.x < ZnO_slab.in > ZnO_slab.out

### copy the output back to your working directory
cp ZnO_slab.out $WORK/.

echo 'job ended at ' `date`

### end script
