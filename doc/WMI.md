Windows Management Instrumentation (WMI)
========================================

Using CMD
---------

You can run WMIC as a shell, or directly as a command line.

-- CMD 
C:\Users\user>wmic /?

WMIC is deprecated.

[global switches] <command>

The following global switches are available:
/NAMESPACE           Path for the namespace the alias operate against.
/ROLE                Path for the role containing the alias definitions.
/NODE                Servers the alias will operate against.
/IMPLEVEL            Client impersonation level.
/AUTHLEVEL           Client authentication level.
/LOCALE              Language id the client should use.
/PRIVILEGES          Enable or disable all privileges.
/TRACE               Outputs debugging information to stderr.
/RECORD              Logs all input commands and output.
/INTERACTIVE         Sets or resets the interactive mode.
/FAILFAST            Sets or resets the FailFast mode.
/USER                User to be used during the session.
/PASSWORD            Password to be used for session login.
/OUTPUT              Specifies the mode for output redirection.
/APPEND              Specifies the mode for output redirection.
/AGGREGATE           Sets or resets aggregate mode.
/AUTHORITY           Specifies the <authority type> for the connection.
/?[:<BRIEF|FULL>]    Usage information.

For more information on a specific global switch, type: switch-name /?


-- SHELL
PS C:\Users\user> wmic
wmic:root\cli>/?

WMIC is deprecated.

[global switches] <command>

The following global switches are available:
/NAMESPACE           Path for the namespace the alias operate against.
/ROLE                Path for the role containing the alias definitions.
/NODE                Servers the alias will operate against.
/IMPLEVEL            Client impersonation level.
/AUTHLEVEL           Client authentication level.
/LOCALE              Language id the client should use.
/PRIVILEGES          Enable or disable all privileges.
/TRACE               Outputs debugging information to stderr.
/RECORD              Logs all input commands and output.
/INTERACTIVE         Sets or resets the interactive mode.
/FAILFAST            Sets or resets the FailFast mode.
/USER                User to be used during the session.
/PASSWORD            Password to be used for session login.
/OUTPUT              Specifies the mode for output redirection.
/APPEND              Specifies the mode for output redirection.
/AGGREGATE           Sets or resets aggregate mode.
/AUTHORITY           Specifies the <authority type> for the connection.
/?[:<BRIEF|FULL>]    Usage information.

For more information on a specific global switch, type: switch-name /?


Credentials
-----------
WMIC /user:admin /password:abc123.... 


Computers/Nodes
---------------
WMIC /node:@computers.txt /failfast:on PROCESS call create "\\server\share\installer.cmd"

WMIC /node:computer64 /output:shares.html SHARE get name,path /format:htable


Other commands
--------------
:: Display the DELL Serial number (also works for some other brands)
WMIC BIOS get serialnumber

:: List the available key/value pairs for the computer:
WMIC COMPUTERSYSTEM get * /format:list |more

:: Display Memory and domain join status:
WMIC COMPUTERSYSTEM get PartofDomain,TotalPhysicalMemory /format:list 

:: List the available key/value pairs for the OS:
WMIC OS get * /format:list |more

:: List the OS build and version
WMIC OS LIST BRIEF

:: List the computername, locale and Bootdevice:
WMIC OS GET csname, locale, bootdevice /value

WMIC OS GET osarchitecture /value

:: Get a list of installed Windows updates on a remote machine, unlike Get-Hotfix, this includes the installation date.
WMIC /NODE:"server64" QFE list 

:: Get the local date and time
WMIC OS GET localdatetime

:: List all local Disks
WMIC LOGICALDISK where drivetype!=4 get deviceid, description, volumename

:: List ipv4 adapters 
WMIC NICCONFIG where (IPEnabled=True and TcpipNetbiosOptions!=null and TcpipNetbiosOptions!=2) GET caption,index,TcpipNetbiosOptions,IPEnabled

:: Disable Netbios
WMIC NICCONFIG where (IPEnabled=True and TcpipNetbiosOptions!=null and TcpipNetbiosOptions!=2) CALL SetTcpipNetbios 2

:: Dump the full application event log to a text file:
WMIC NTEVENT List Full >appevents.txt

:: List all the running services and save to a file
WMIC SERVICE where (state="running") GET caption, name, state > services.tsv

:: Stop the TELNET service (also StartService, PauseService,ResumeService)
WMIC SERVICE where caption='TELNET' CALL StopService

:: List the installed software MSI's
WMIC PRODUCT GET name,vendor,version
WMIC PRODUCT GET InstallDate, Name,localPackage 

:: Display Printer Status
WMIC PRINTER LIST brief
WMIC PRINTER LIST /?
WMIC PRINTER where PortName="LPT1:" GET PortName, Name, ShareName
 
WMIC /INTERACTIVE:ON PRINTER where PortName="LPT1:" DELETE

WMIC PROCESS where name='evil.exe' delete

WMIC /output:"%computername%.txt" MEMORYCHIP where "memorytype=17" get Capacity

WMIC /node:computer64,computer65 PROCESS call create "netstat.exe -ano > C:\output.txt"

WMIC /node:@computers.txt /failfast:on PROCESS call create "\\server\share\installer.cmd"

WMIC /node:computer64 /output:shares.html SHARE get name,path /format:htable

WMIC /node:computer64 SHARE where name="Share1" 


Switches
--------
Syntax
wmic [global switches] <command>
Global switches
/NAMESPACE	NAMESPACE - Path for the namespace the alias is to operate against. Namespaces are always relative. That is, if the namespace does not begin with a "\\" it is assumed to be relative to the current namespace.
USAGE:
/NAMESPACE:<namespace>

/ROLE	ROLE - Path for the role containing the alias definitions to be available for the utility session.
USAGE:
/ROLE:<namespace>
NOTE: Roles are namespaces and should be treated in the same way - i.e., relative paths should behave appropriately (default namespace is
'\\root\cli').

/NODE	NODE - Specify what servers the alias will operate against.
USAGE:
/NODE:<machine id list>
NOTE: <machine id list> ::= <@filename | machine id> | <@filename | machine id> <,machine id list>
NOTE: Enclose the switch value in double quotes, if the value contains special characters like '-' or '/'.

/IMPLEVEL	IMPLEVEL - Determine what level the command line should impersonate. Default is 'Impersonate'.
USAGE:
/IMPLEVEL:<implevel>[/AUTHORITY:<authority type>]
Various implevels are as follows:
Impersonation Level
------------------
Anonymous
Identify
Impersonate
Delegate
Note: Use /AUTHORITY switch for specifying the authority type.

/AUTHLEVEL	AUTHLEVEL - Specify the level the command line should authenticate. Default is 'Pktprivacy'.
USAGE:
/AUTHLEVEL:<authlevel>
Various authlevels are as follows:
Authlevel
---------
Default
None
Connect
Call
Pkt
Pktintegrity
Pktprivacy

/LOCALE	LOCALE - Specify the language id the command line should use.
USAGE:
/LOCALE:<locale identifier>
NOTE: The parameter to the 'LOCALE' switch is of the form MS_XXX.
Where XXX for English is 409, XXX for Finnish is 40b.

/PRIVILEGES	PRIVILEGES - Enable or disable all privileges.
USAGE:
/PRIVILEGES:<option>
NOTE: Allowed value(s) for <option> is either ENABLE or DISABLE.

/TRACE	TRACE - Specify whether output debug information is to be copied to stderr during the processing of the request(s).
USAGE:
/TRACE:<option>
NOTE: Allowed value(s) for <option> is either ON or OFF.

/RECORD	RECORD - Logs all entered commands and WMIC's output to a file in XML format.
USAGE:
/RECORD:<filepath>

/INTERACTIVE	INTERACTIVE - Sets or resets the interactive mode.
USAGE:
/INTERACTIVE:<option>
NOTE: Allowed value(s) for <option> is either ON or OFF.

/FAILFAST	FAILFAST - Sets or resets the FailFast mode.
USAGE:
/FAILFAST:<option>
NOTE: Allowed value(s) for <option> is either ON or OFF.

/USER	USER - Provides the user to be used during the session.
USAGE:
/USER:<userid>
NOTE: User should be provided in the form <domain>\<user>.

/PASSWORD	PASSWORD - Provides the password to be used in logging on to this session.
USAGE:
/PASSWORD:<password>

/OUTPUT	OUTPUT - Specifies the mode for output redirection.
USAGE:
/OUTPUT:<outputspec>
NOTE: <outputspec> ::= (STDOUT | CLIPBOARD | <filename>)
STDOUT - Output is redirected to the STDOUT.
CLIPBOARD - Output is copied on to CLIPBOARD.
<filename> - Output is written to the specified file.

/APPEND	APPEND - Specifies the mode for output redirection.
USAGE:
/APPEND:<outputspec>
NOTE: <outputspec> ::= (STDOUT | CLIPBOARD | <filename>)
STDOUT - Output is redirected to the STDOUT.
CLIPBOARD - Output is copied on to CLIPBOARD.
<filename> - Output is appended to the specified file.

/AGGREGATE	AGGREGATE - Determines the mode of displaying results.
USAGE:
/AGGREGATE:<option>.
NOTE: Allowed value(s) for <option> is either ON or OFF.

/AUTHORITY	AUTHORITY - Specifies the <authority type> for the connection.
USAGE:
/AUTHORITY:<authority type>

/?	/? - Displays specification/syntax for help commands.
USAGE:
/?:[<helpType>]
NOTE: Allowed value(s) for <helpType> is either BRIEF or FULL.



---------------------


There are three easy things you need to do uninstall a program using WMIC.

Open a CMD prompt running as an admin
Figure out the EXACT name of the program by having WMIC produce a list:
wmic product get name

Use WMIC PRODUCT NAME command to remove the program you want 
wmic product where name="<PROGRAM NAME HERE>" call uninstall /nointeractive
If you do not use the /nointeractive switch, WMIC will prompt the user to confirm the uninstall, which likely defeats the purpose of the scripting the uninstall

Also note that wild cards can be used with WMIC but the command is slightly different:
wmic product where "name like '<PROGRAM NAME HERE>%%'" call uninstall

You also may want to clean up the installation folder, if it still exists using:
rd /s /q C:\Program Files\<PROGRAM FOLDER NAME HERE>
