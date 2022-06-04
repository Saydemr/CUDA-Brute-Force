# CUDA Brute Force 

This is the repository of a course project about finding the time taken to brute force passwords of various length and complexity. Pydictor is used to create passwords and hashes. Files are stored [here](https://drive.google.com/drive/folders/1GS69Dri1jtHbZu4Ypk7VMBoaJ6jWL3p_?usp=sharing). Hashcat will be used to compare the hashes. Other relevant materials including code, data, documents etc. are all published to this repository.

## Project Information
- Institution: [Ozyegin University](https://www.ozyegin.edu.tr/en)

## Members
- [Mervegul Parlak](https://github.com/ctllmp)
- [Abdullah Saydemir](https://github.com/Saydemr)

## Course Information
- Supervisor TA: [Majd Latah](https://github.com/majdlatah)
- Course Instructor: [Ismail Ari](https://faculty.ozyegin.edu.tr/ismailari/)

## HOW TO

### Pre-requisites
- Linux/Unix system capable of running bash scripts.
- [Git](https://git-scm.com/download/linux) Latest
- [Hashcat](https://hashcat.net/hashcat/) v6.2.5
- [CUDA](https://developer.nvidia.com/cuda-downloads?target_os=Linux) v11.5 & OpenCL

### Install Pre-requisites
```
sudo apt-get install -y git
```
Install CUDA Toolkit from the given link.
Install Hashcat from the given link.

### Clone the repository
```
git clone https://github.com/Saydemr/CUDA-Brute-Force.git && cd CUDA-Brute-Force
git submodule init && git submodule update
```

### Create the hashes
This takes time and requires a lot of disk space. You can use precomputed hashes from [here](https://drive.google.com/drive/folders/1GS69Dri1jtHbZu4Ypk7VMBoaJ6jWL3p_?usp=sharing).
```
chmod +x creator.sh
./creator.sh
```

### Run the tests
As the length and complexity increases, time to crack password also increase. You may press "s" to learn the estimated time and "q" to exit.
```
chmod +x checker.sh
./checker.sh
```
