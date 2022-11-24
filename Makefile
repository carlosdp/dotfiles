compile-ycm:
	./.vim-new/bundle/youcompleteme/install.py --rust-completer

install-rls:
	rustup component add rls-preview rust-analysis rust-src

install:
	./install.sh
