install_dir=${HOME}/.local/bin
install:
	@mkdir -p ${install_dir}
	@cp ycut.sh ${install_dir}
	@chmod +x ${install_dir}/ycut.sh
