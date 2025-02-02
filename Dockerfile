FROM debian:12.9

RUN apt-get update && apt-get upgrade
RUN apt-get install -y --force-yes which sed binutils build-essential diffutils gcc g++ \
    bash patch gzip bzip2 perl tar cpio unzip rsync file bc findutils wget  \
    python3 libncurses5-dev libncursesw5-dev libncurses5 libncursesw5 git   \
    curl cvs mercurial openssh-client subversion 

RUN wget https://buildroot.org/downloads/buildroot-2024.11.1.tar.gz
RUN tar zxvf buildroot-2024.11.1.tar.gz && rm buildroot-2024.11.1.tar.gz
RUN mkdir /var/buildroot
RUN mv buildroot-2024.11.1/* /var/buildroot 
RUN rm -r buildroot-2024.11.1
