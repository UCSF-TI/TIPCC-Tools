validate: validate_show

validate_show:
	modules=$$(module -t avail 2>&1 | grep -vF ':'); \
	for m in $$modules; do \
	    printf "$$m ... "; \
	    if module show $$m 2> /dev/null; then \
	       echo "OK"; \
	    else \
	       echo "ERROR"; \
	       module show $$m x; \
	    fi; \
	done
