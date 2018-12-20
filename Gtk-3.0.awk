#!/usr/bin/awk
#
# Patch the generated wrapper Swift code to handle special cases
#
BEGIN { depr_init = 0 }
/open .* ColorSelection/ { depr_init = 1 }
/.* ColorSelection/ { depr_init = 1 }
/.* HSV/ { depr_init = 1 }
/open .* HSV/ { depr_init = 1 }
/.* init.. {/ {
	if (depr_init) {
		printf("@available(*, deprecated) ")
		depr_init = 0
	}
}
/.* init. title:/ {
	if (depr_init) {
		printf("@available(*, deprecated) ")
		depr_init = 0
	}
}
// { print }
