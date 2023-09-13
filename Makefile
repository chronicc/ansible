list-applications:
	@cat playbooks/run.yml | grep -oP "app_[^ ]+" | sort | uniq

list-features:
	@cat playbooks/run.yml | grep -oP "feature_[^ ]+" | sort | uniq

