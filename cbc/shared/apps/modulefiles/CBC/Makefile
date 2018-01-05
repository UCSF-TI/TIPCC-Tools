validate: validate_show

validate_show:
	modules=$$(module -t avail 2>&1 | grep -vF ':'); \
	for m in $$modules; do echo $$m; module show $$m; done
