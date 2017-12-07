validate: validate_show

validate_show:
	mm=$(module -t avail 2>&1 | grep -vF ':')
	for m in $mm; do echo $m; module show $m; done
