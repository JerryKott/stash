#!/pps/jkott/stash/smalltalk.sh

| file |

'This is a test' stdout.
'' stdout.
'100 factorial is:' stdout.
100 factorial printString stdout.
'' stdout.
'The command that started this script:' stdout.
CEnvironment commandLine stdout.
'' stdout.
"
file := CEnvironment commandLine last.
('This is the contents of ', file, ' script that runs this program:') stdout.
'*****************' stdout. 
file asFilename contentsOfEntireFile stdout.
"

ObjectMemory quit.
