# Windows

## Bacth Script
You can write Windows scripts using batchfile that are DOS / [CMD](https://ss64.com/nt/) lines for windows. For more advance features, the best is still to use PowerShell.

## Installing files
To start a `.exe` file you can either use `start` to start it or use use its `name.exe` to install it.
Get [help](https://technet.microsoft.com/en-us/library/cc770297(v=ws.11).aspx) on the [start](https://ss64.com/nt/start.html) command:

```batch
    start /?
```
## Autorun
When plugin something from a computer, you can have [default action](https://www.howtogeek.com/howto/windows-vista/disable-autoplay-in-windows-vista/). One of them is reading the `autorun.inf` file which have instruction to start softawre (DVD -> launching the movie, CD -> launching the software or music, and all). Be careful some malicious softwares can be run too.

Inside your `autorun.int` :
```python (for colouring)
	[autorun]
	open = application_to_start.bat
```
	
## Errors or problem encountered

- [#3](https://github.com/Sylhare/Windows/issues/3) Error: Favorite Links folder broken on windows' explorer
- [#2](https://github.com/Sylhare/Windows/issues/2) Error: BOOTMGR is missing at boot & 0xc000000f
- [#1](https://github.com/Sylhare/Windows/issues/1) Error: VT-x is disabled in the BIOS for all CPU modes (VERR_VMX_MSR_ALL_VMX_DISABLED)
	
## Source

- [CMD Info](http://steve-jansen.github.io/guides/windows-batch-scripting/part-1-getting-started.html)
- [Silent install examples](http://help.tracker-software.com/EUM/default.aspx?pageid=silent_installation_pro5)
- [Write a simple batch file](https://www.howtogeek.com/263177/how-to-write-a-batch-script-on-windows/)
    
