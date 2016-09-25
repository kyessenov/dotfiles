syn region texBoldStyle	matchgroup=texTypeStyle start="\\emph\s*{" matchgroup=texTypeStyle  end="}" concealends contains=@texItalGroup,@Spell
syn match texZone "\\code{.\{-}}"

hi clear texItalStyle
hi clear texBoldItalStyle
hi clear texItalBoldStyle

hi texItalStyle		gui=italic	cterm=underline
hi texBoldItalStyle		gui=bold,italic cterm=bold,underline
hi texItalBoldStyle		gui=bold,italic cterm=bold,underline
