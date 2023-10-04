- DETcurve for the different weight levels is the result of the performance of the different faces.
- EER&FMR@0.1.py is the extension of the DET code to calculate the EER and FNMR@FMR=0.1
- Manipulated face is the dataset with weight-simulated face images from the starting database.
- Score file is the mated score and non-mated score for the different weight levels and baseline.
- MagFace File is the extension files used in the Magface.
- readme.txt is this file.

There are two open-source code used in my project, and I store them in the google colab. The website is as follows.
**Training code:**
 https://colab.research.google.com/drive/1CWuUt-wQDeo_In-NBNqXdirF_fKTRij0

**Image generate code:**
 https://colab.research.google.com/drive/11Yr58NQI1c3hKZXN5E3jwMNuEP0TMwLD

**MagFace git repo: **
 https://github.com/IrvingMeng/MagFace/tree/main
When using the MagFace to calculate scores, use the pair list in the MagFace File folder, there is a brief introduction of the use of magface.

- make a folder in /data/frgc. 
- Store all of the original face and manipulated face in it. 
- download the magface_epoch_00025.pth  into eval/eval_recognition/
- Store the pair lists into /eval/eval_recognition/data/frgc
- use the "frgc_eval.sh magface_epoch_00025.pth official 100" to run the codes to get the scores. 


