REM This is ugly but seems to work ok
for /R "Packages" %%a in (*.rc) do (
	ECHO %%a | FIND /I "Templates" > Nul && ( 
		REM Echo.Template
	) || (
		brcc32 "%%a"	
	)
)
