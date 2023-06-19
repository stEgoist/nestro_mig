
ADMT group /F "C:\tools\groups4mig.txt"  /IF:yes /SD:"source.domain.local" /TD:"target.domain.local" /TO:"destination" /mss:no /mgs:yes
admt task /last:1 /getlog:yes /folder:"c:\tools"
pause