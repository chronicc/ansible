ansible-galaxy-install-roles:
	ansible-galaxy install -r requirements.yml --ignore-errors

list-server-applications:
	@cat playbooks/10-server.yml | grep -oP "app_[^ ]+" | sort | uniq

list-server-features:
	@cat playbooks/10-server.yml | grep -oP "feature_[^ ]+" | sort | uniq
