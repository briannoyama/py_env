#Extended from https://github.com/gklingler/docker3d

FROM ubuntu
MAINTAINER github/briannoyama

RUN  apt-get update --fix-missing                                            &&\ 
     apt-get install -y --no-install-recommends apt-utils

#Install opengl
COPY keyboard /etc/default/keyboard
RUN  apt-get install -y --no-install-recommends mesa-utils                     \
                                                xserver-xorg-video-all         \ 
                                                libsdl2-dev                    \
                                                libsdl2-image-dev              \
                                                libsdl2-mixer-dev              \
                                                libsdl2-net-dev                \
                                                libsdl2-ttf-dev                \
                                                gcc

#Install Python
RUN  apt-get install -y --no-install-recommends python3-dev                    \
                                                python3-pip
                 
#Install Cython
RUN  pip3 install Cython


#Install vim
RUN  apt-get install -y --no-install-recommends vim curl git
RUN  mkdir -p ~/.vim/colors ~/.vim/autoload ~/.vim/bundle ~/.vim/ftplugin    &&\
     curl -o ~/.vim/colors/seoul256.vim https://raw.githubusercontent.com/junegunn/seoul256.vim/master/colors/seoul256.vim &&\
     curl -o ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim &&\
     curl -o ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492 &&\
     cd ~/.vim/bundle                                                        &&\
     git clone --depth=1 https://github.com/Lokaltog/vim-powerline.git       &&\
     rm -R vim-powerline/.git                                                &&\
     git clone --recursive --depth=1 git://github.com/davidhalter/jedi-vim.git &&\
     rm -R jedi-vim/.git

COPY .vimrc /root/.vimrc

#Get other development related software
RUN apt-get install -y --no-install-recommends tmux

COPY entry.sh /usr/local/bin/entry.sh
ENTRYPOINT ["entry.sh"]
