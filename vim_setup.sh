echo "Installing dependencies"
dnf install -y vim go npm nodejs python python-devel python3 python3-devel \
    cmake automake mono-devel

echo "Downloading LibClang and LLVM"
wget -O /home/user/Downloads/Clang+llvm-3.8.0-x86_64-fedora23.tar.xz http://llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-fedora23.tar.xz
mkdir /home/user/Downloads/llvm_root_dir/
echo "Extracting LibClang and LLVM"
tar -xvf clang+llvm-3.8.0-x86_64-fedora23.tar.xz -C /home/user/Downloads/llvm_root_dir/

echo "Building YCM makefiles"
mkdir ~/ycm_build && cd ~/ycm_build
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/Downloads/llvm_root_dir . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core

echo "Setting up support for additional languages"
echo "OmniSharp"
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/OmniSharpServer/ && xbuild
echo "GoLang"
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/gocode/ && go build
echo "TypeScript"
npm install -g typescript
echo "JavaScript"
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/tern_runtime/ && \
    npm install --production

#cd ~/.vim/bundle/YouCompleteMe/ && ./install.py
