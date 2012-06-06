bundles:
	@cd vim/.vim/bundle/command-t/ruby/command-t && ruby extconf.rb && make
symlinks:
	@echo "..."$(CURDIR)
	@ln -sf $(CURDIR)/vim/.vimrc ~/.vimrc
	@ln -sf $(CURDIR)/vim/.vim ~/.vim
	@ln -sf $(CURDIR)/bash/.bash_profile ~/.bash_profile
