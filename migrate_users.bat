
ADMT USER /F "C:\tools\users4mig.txt"  /IF:yes /SD:"source.domain.local" /TD:"target.domain.local" /TO:"destination" /mss:no /mgs:yes
admt task /last:1 /getlog:yes /folder:"c:\tools"
pause