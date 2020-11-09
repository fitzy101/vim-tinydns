" tinydns-data syntax file, see: http://cr.yp.to/djbdns/tinydns-data.html
" Maintainer: Michael Fitz-Payne

if exists("b:current_syntax")
	finish
endif

" match colons within dnsDetails
syn match dnsSplit ':'

" match the .. and ... groups
syn match dnsZoneShortcut contained '\.\.'
syn match dnsZoneShortcut contained '\.\.\.'

" match the in, ex, and lo keywords.
syn match dnsKw contained 'in$'
syn match dnsKw contained 'in:'
syn match dnsKw contained 'ex$'
syn match dnsKw contained 'lo$'
"
" match the entry lines
syn match dnsDetails '[^:]' nextgroup=dnsSplit contains=dnsZoneShortcut,dnsKw

syn match dnsEntry '^&' nextgroup=dnsDetails
syn match dnsEntry '^+' nextgroup=dnsDetails
syn match dnsEntry '^=' nextgroup=dnsDetails
syn match dnsEntry '^C' nextgroup=dnsDetails
syn match dnsEntry '^Z' nextgroup=dnsDetails
syn match dnsEntry '^6' nextgroup=dnsDetails
syn match dnsEntry '^3' nextgroup=dnsDetails
syn match dnsEntry '^\^' nextgroup=dnsDetails
syn match dnsEntry '^:' nextgroup=dnsDetails
syn match dnsEntry '^\.' nextgroup=dnsDetails
syn match dnsEntry '^\'' nextgroup=dnsDetails

" comments _only_ apply when the line starts with a hash
syn match dnsComment "#.*$"

let b:current_syntax = "tinydns"
highlight link dnsEntry Identifier
highlight link dnsDetails String
highlight link dnsComment Comment
highlight link dnsSplit Character
highlight link dnsZoneShortcut Type
highlight link dnsKw Type

