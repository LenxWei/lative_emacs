lative emacs customization

- fosusing on usability of EMACS for programming

INSTALL:

* copy lative.el as ~/.emacs
* edit ~/.emacs to adjust some options in the first section
* open emacs, and press F1 F1 to look up the help screen

Basic Operations:                             Cursor Operations                                                       
----------------                              -----------------                                                       
C-`      Emacs Menu                           Home      Move to head of line                                          
C-z      Undo                                 C-a                                                                     
C-g      Cancel                               End       Move to end of line                                           
M-h m    Current mode's help                  C-e                                                                     
C-M-z    Suspend Emacs                        PgUp      Page up                                                       
M-m      Toggle syntax hightlight             C-b                                                                     
C-x C-c  Close Emacs                          PgDn      Page down                                                     
                                              C-f                                                                     
File Operations:                                                                                                      
---------------                               C-PgUp    Move to head of file                                          
C-x f    Open file                            C-PgDn    Move to end of file                                           
C-x r    Open recent file (try e,s,f)         C- ->     Move to next word                                             
M-s      Save file                            M-f                                  
C-x w    Save as                              C- <-     Move to previous word                                         
C-q      Close file                           M-b                                                                     
                                              M-g       Go to line                                                    
                                                                                                                      
Search Operations                             M-r       Register current pos                                          
-----------------                             M-t       Go to pos                                                     
C-s      Incremental searching                                                                                        
C-r      Incremental reverse searching        Block Operations                                                        
C-s C-s  Continue searching                   ----------------                                                        
C-r C-r  Continue reverse searching           M-a       Select all                                                    
M-$      Spell check current word             C-v       Mark block start pos                                          
M-.      Lookup define                        C-g       Cancel marking                                                
M-*      Go back from lookup                  M-c       Copy                                                          
C-.      Lookup next define                   C-Insert                                                                
                                              M-v       Paste                                                         
Debug Operations                              S-Insert                                                                
----------------                              M-d       Cut or kill word                                              
F2       Make or compile                      C-k       Line erase                                                    
F3       Debug                                                                                                        
F4       Print value of variable              Window Operations                                                       
F5       Continue running                     -----------------                                                       
F6       Finish current function              M-`     Select buffer (try e,s,f)                                       
F7       Next                                                                                                         
F8       Step                                 M-e     Split current window                                            
F9       Set breakpoint                       M-w     Maximize current window                                         
F10      Remove breakpoint                    M-q     Close current window                                            
F11      Set temp breakpoint                  M-o     Switch to next window                                           
F12      Stepi                                C-Tab   Switch to next buffer        
M-F12    Nexti in gdb mode                    C-M-Tab Switch to previous buffer                                       

Folding Operations
------------------
C-c h    toggle folding
C-c H    hide all blocks
C-c S    show all blocks
                                                                                                                      
Finally, you can use F1 F2 to lookup original help-for-help of Emacs :)       
