;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  lative emacs customization  ;;;
;;;  by lenx                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; focusing on usability of EMACS for programming
;;;
;;; [:_lative_Anchor_1_:]
;;;
;;; Version: 1.3.3
;;;
;;; $Id: lative.el 790 2006-05-30 16:33:31Z weitao $
;;;
;;; Copyright (C)  2005  lenx ( Wei Tao at ICST of Peking Univ. )
;;;
;;; This program is free software; you can redistribute it and/or
;;; modify it under the terms of the GNU General Public License
;;; as published by the Free Software Foundation; either version 2
;;; of the License, or (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program; if not, write to the Free Software
;;; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
;;; 02111-1307, USA.
;;;
;;;;;;;;;;;;;;;;;;;;;;;
;;;  configuration  ;;;
;;;;;;;;;;;;;;;;;;;;;;;
; [:_lative_Anchor_2_:]

; Chinese
(setq lative_Chinese t)

; NT emacs Chinese
(setq lative_ntemacs nil)

; work around ~ bug of emacs when su
(setq lative_homedir "~")

;;;;;;;;;;;;;;;;;;;;;;
;;;  some options  ;;;
;;;;;;;;;;;;;;;;;;;;;;

(set-default-font "-Adobe-Courier-Medium-R-Normal--18-180-75-75-M-110-ISO8859-1")

; highlight
(transient-mark-mode t)
(show-paren-mode t)
(global-font-lock-mode t)
(mouse-wheel-mode t)

; show line & column information
(line-number-mode t)
(column-number-mode t)

; folding support
    (load-library "hideshow")
    (add-hook 'c-mode-common-hook   'hs-minor-mode)
    (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
    (add-hook 'java-mode-hook       'hs-minor-mode)
    (add-hook 'lisp-mode-hook       'hs-minor-mode)
    (add-hook 'perl-mode-hook       'hs-minor-mode)
    (add-hook 'python-mode-hook     'hs-minor-mode)
    (add-hook 'sh-mode-hook         'hs-minor-mode)
    (add-hook 'c++-mode-hook 'hs-minor-mode)
    (setq-default hs-hide-comments-when-hiding-all t)


;;;;;;;;;;;;;;;;;;;
;;;  todo list  ;;;
;;;;;;;;;;;;;;;;;;;
; [:_lative_Anchor_3_:]
;
; v 1.3 & 2.0
;  * design a framework to support the functions mentioned below.
;    minimize the maintaining effort
;     - such as,  main keymap is fixed in every mode - v 1.3.2!
;     . Basic Operations
;     . Window Operations
;     . File Operations (M-s may have other meaning...)
;     . Anchor, Block and Search Operations for editing modes
;     . Debug Operations for programming & gud modes
;    <G>
;     . try some hook to need not to set local key binds in every mode-hook ?
;     . or just simply define-key in a loop & local-set-key in a loop of add-hook 
;     . and, could print out the conflicted key bindings.
;    <B>
;     + a map list, for key, func, popup menu description, (and?) F1F1 help msg
;       (for popup menu generation & F1 F1 help screen)
;     + write a general hook function, which local-set-key for every major mode
;     + write a general define-key function, which copees with modes whithout hooks
;     + use major-mode (or mode-name ? no major-mode better) to identify current mode
;     ~ a big work :pp
;
;   - a semi-automatically generated F1 F1 help screen - v 1.3.3
;     mix help segments in codes, 
;     picture mode?
;
;   - need to recognize the difference between X mode and text mode,
;     using: if  (eq window-system 'x) ...
;
;   - tip-popup-timer  - v 1.3.4
;     to simplify implementation of idle 1s popup
;
;  * add anchor help  - v 1.3.5
;    using find-tag to search anchors
;    add a tagging tool
;    add new keybindings, or just use find-tag scheme, sort the 
;       result first according to the need or anchor system
;
;  * using pop-up menu for modes' special operations - v 1.3.4
;    including mouse right click pop-up menu & key activate pop-up menu
;
;    using: C-x idle 1s to popup global popup menu
;    using: C-c idle 1s to popup mode local popup menu
;    using: C-x f idle 1s to popup find-file window
;
;    maybe should use elisp timer mechanism, 
;    such as run-with-idle-timer & cancel-timer
;
;  * fix kill-word, or just forward-word ?
;    kill to first non-space char out of current word or non-space continuation
;
;  * add cpp support in Makefile.tpl
;
;  * simplify menu window prompts.
;
;  * make buffer menu easier to use, move emacs-specific buffers to the bottom
;
;  * make recentf easier to use, no emacs-specific items?
;
;  * test the usability of gdbui mode
;
;  * adjust dir of install package  - v 2.0RC
;    ~/
;      .emacs     -- only configurations & initializations
;      .emacs.d/
;               elisp/
;                     lative.el
;                     gdbui/
;
;  * add test suite ?
;
;  * add cpp member function expansion
;
;  * add diff & merge support when detected modification out of current section
;
;  * auto deleting tailing whitespace when saving ?
;
;  * emacs-bug: file duplication status, such as symbol link, isn't up to date automatically
;
;  * add set-frame-name support
;
;;;;;;;;;;;;;;;;;;;;
;;;  what's new  ;;;
;;;;;;;;;;;;;;;;;;;;
; [:_lative_Anchor_3_:]
;
; v 1.3.3
;   * remove svn/template support
;   * add folding support
;
; v 1.3.2
;   * add mouse-wheel-mode, for cygwinX
;   * change font size
;
; v 1.3.1
;  * anchor, a kind of persistent pos register using markup tags.
;    insert and find tags like [:_filebase_Anchor_7_:]
;  * add C-x c to svn ci
;
; v 1.3.0
;  * add license information
;  * fix keyboard to gdb-mode
;  * assign M-F12 & C-M-= to gud-nexti in gdb mode
;  * add 3rd code credit
;  * adjust code section positions
;  * add customization section for emacs in .emacs
;  * fix forward-word, and delete-word, not perfect yet :<
;  * set default ispell dictionary for Chinese
;  * add svn Id & Rev keyword
;  * add M-1 to activate lative help screen
;  * add C-M-o to other-window, in case M-o in use
;  * restore i,j in buffer menu & recent mode
;
; v 1.2.1
;  * simplify keys
;      M-s   : save
;      C-x f : open file
;      C-x r : recent file
;      C-x w : save as
;      use e-up s-down in buffer menu & recentf
;      C-.   : find next tag
;
; v 1.2.0
;    add Makefile for package
;    add F1 F1 help screen
;    add template module
;    add M-` & M-[ to open buffer menu
;    add M-s to other window
;    use C-` to open emacs menu
;    remove M-n
;
; v 1.1.0
;    introduce gdb mode, disabled by default
;    introduce smart compile for c & c++
;    adjust keys:
;      f2: make/compile, smart compile for c & c++
;      f3: debug
;      f4: print
;      f5: continue
;      f6: finish
;      f7: next
;      f8: step
;      f9: break
;      f10: remove
;      f11: tbreak
;      f12: stepi
;    add perl mode
;    adjust C-q to close its window at the same time
;    adjust M-p to open buffer menu
;    adjust M-g to goto line
;    add psvn support
;
; v 1.0.2
;    adjust F9 to break, F11 to remove break
;
; v 1.0.1
;    adjust C-z, M-z, M-r, M-t, M-n, M-m
;    add configuration section
;
; v 0.99.2
;    add [f2] to print value of var during debugging
;    note: pdb process of gud is buggy: gud-remove, 
;          gud-break should use %f:%l, not just %l
;
; v 0.99.1
;    nt emacs chinese fonts fix
;    c-tab to switch buffers
;
; v 0.99
;    scrolling smoothly
;    speedbar & cscope support (option)
;    recent files
;
; v 0.98
;    fix pdb toggle breakpoint
;
; v 0.97
;    add python-mode
;
; v 0.96
;    fix customization for c-indent
;    add C-q to kill buffer
;
; v 0.95
;    add customization for c-indent
;
; v 0.94
;    add dired-mode-hook
;
; v 0.93
;    add c++-mode-hook
;
; v 0.92
;    fix M-q to delete-window, if fail then to kill-this-buffer
;    (lenx-delete-window)
;
; v 0.91
;    fix M-q to kill-this-buffer, not to delete-window
;
; v 0.9
;    use process-filter to intercept "No Breakpoint"
;
; v 0.5
;    initial implementation
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  module loading & 3rd code  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [:_lative_Anchor_4_:]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;    Chinese setting    ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if lative_Chinese
    (progn
      (setq default-enable-multibyte-characters t)
      (set-keyboard-coding-system 'chinese-iso-8bit)
      (set-terminal-coding-system 'chinese-iso-8bit)
      (setq coding-system-for-read 'chinese-iso-8bit)
      (setq coding-system-for-write 'chinese-iso-8bit)
      (setq current-language-environment "Chinese-GB")
      (setq ispell-dictionary "american")
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;    NT Emacs Chinese Font setting   ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if lative_ntemacs
    (progn
      (set-w32-system-coding-system 'chinese-iso-8bit)

      (create-fontset-from-fontset-spec
       "-*-Courier New-normal-r-*-*-12-*-*-*-c-*-fontset-cn, chinese-gb2312:-*-Terminal-normal-r-*-*-12-*-*-*-c-*-gb2312-*" t)

      (setq default-frame-alist
	    (append
	     '((font . "fontset-cn"))
	     default-frame-alist))
   )
)

;;;;;;;;;;;;;;;;;;;;;;
;;;  recent files  ;;;
;;;;;;;;;;;;;;;;;;;;;;

(require 'recentf)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ r" 'recentf-open-files)

; must set before set recentf-mode, amazing. :p
(add-hook 'recentf-mode-hook
        '(lambda ()
            ; use e & s / i & j to up and down
	    (define-key recentf-dialog-mode-map "e" 'previous-line)
	    (define-key recentf-dialog-mode-map "s" 'next-line)
	    (define-key recentf-dialog-mode-map "i" 'previous-line)
	    (define-key recentf-dialog-mode-map "j" 'next-line)
	    (define-key recentf-dialog-mode-map "f" 'widget-button-press)
         )
)
(recentf-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  switch buffers with c-tab  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; by CRS
; copyed from emacswiki
;

; necessary support function for buffer burial
(defun crs-delete-these (delete-these from-this-list)
  "Delete DELETE-THESE FROM-THIS-LIST."
  (cond
   ((car delete-these)
    (if (member (car delete-these) from-this-list)
	(crs-delete-these (cdr delete-these) (delete (car delete-these)
                                                     from-this-list))
      (crs-delete-these (cdr delete-these) from-this-list)))
   (t from-this-list)))


; this is the list of buffers I never want to see
(defvar crs-hated-buffers
  '("KILL" "*Compile-Log*"))


; as well use this for both
(setq iswitchb-buffer-ignore (append '("^ " "*Buffer") crs-hated-buffers))


(defun crs-hated-buffers ()
  "List of buffers I never want to see, converted from names to buffers."
  (delete nil
	  (append
	   (mapcar 'get-buffer crs-hated-buffers)
	   (mapcar (lambda (this-buffer)
		     (if (string-match "^ " (buffer-name this-buffer))
			 this-buffer))
		   (buffer-list)))))


; I'm sick of switching buffers only to find KILL right in front of me
(defun crs-bury-buffer (&optional n)
  (interactive)
  (unless n
    (setq n 1))
  (let ((my-buffer-list (crs-delete-these (crs-hated-buffers)
					  (buffer-list (selected-frame)))))
    (switch-to-buffer
     (if (< n 0)
	 (nth (+ (length my-buffer-list) n)
	      my-buffer-list)
       (bury-buffer)
       (nth n my-buffer-list)))))


(global-set-key [(control tab)] 'crs-bury-buffer)
(global-set-key [(control meta tab)] (lambda ()
				       (interactive)
				       (crs-bury-buffer -1)))

;;;;;;;;;;;;;;;;;;;;;;;;
;;;   smart compile  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;
; copyed from emacswiki
; but hey, by who?
;

(require 'compile)

(add-hook 'c-mode-hook
    (lambda ()
      (unless (file-exists-p "Makefile")
	(set (make-local-variable 'compile-command)
	     (let ((file (file-name-nondirectory buffer-file-name)))
	       (concat "gcc -O2 -Wall -o " (file-name-sans-extension file)
		       " " file)
	       )
	     )
	)
      )
    )

(add-hook 'c++-mode-hook
    (lambda ()
      (unless (file-exists-p "Makefile")
	(set (make-local-variable 'compile-command)
	     (let ((file (file-name-nondirectory buffer-file-name)))
	       (concat "g++ -O2 -Wall -o " (file-name-sans-extension file)
		       " " file)
	       )
	     )
	)
      )
    )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  elisp functions by lenx  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [:_lative_Anchor_4_:]


(defun lenx_home ()
    "home function by lenx :)"
    (interactive)
    (let ((temp-pos (point)))
       (beginning-of-line-text)
       (if (= (point) temp-pos)
            (beginning-of-line) )
    )
)

(defun lenx_forward_word ()
   "copy from vi-forword-word. Stop at the beginning of the first word from point."
   (interactive)
  (if (re-search-forward "\\w*\\W+\\<" nil t 1)
      t
    nil
  )
)

(defun lenx_delete ()
    "delete function by lenx :)"
    (interactive)
    (condition-case nil
       (kill-region (region-beginning) (region-end))
       (error
	;(kill-region (point) (progn (lenx_forward_word) (point)))
	(kill-word 1)
       )
    )
)

(defun lenx_delete_char ()
    "delete char function by lenx :)"
    (interactive)
    (condition-case nil
       (kill-region (region-beginning) (region-end))
       (error (delete-char 1) )
    )
)

(defun lenx_delete_window ()
   "delete window, if there is only one window, then kill this buffer, by lenx :)"
   (interactive)
   (condition-case nil
      (delete-window)
      (error (kill-this-buffer))
   )
)

(defun lenx_kill_window ()
   "kill window, kill this buffer & its window, by lenx :)"
   (interactive)
   (progn
      (kill-this-buffer)
      (condition-case nil
	(delete-window)
	(error nil)
      )
   )
)

(defun lenx_backspace ()
    "delete char function by lenx :)"
    (interactive)
;    (condition-case nil
;       (kill-region (region-beginning) (region-end))
;       (error (backward-delete-char 1) )
;   )
    (backward-delete-char 1)
)

(defun lenx_findtag ()
    "find next tag by lenx :)"
    (interactive)
    (find-tag "not define tag yet" t nil)
)

(defun lenx_find_anchor (tag)
   "find anchor in [:_FileBase_Anchor_7_:] format, by lenx"
   (interactive "sAnchor Tag:\n" )
   (if (search-forward (concat "_Anchor_" tag "_:\]") nil t nil)
       (recenter 10)
      (if (search-backward (concat "_Anchor_" tag "_:\]") nil t nil)
	  (progn
	    (beginning-of-buffer)
	    (search-forward (concat "_Anchor_" tag "_:\]") nil t nil)
	    (recenter 10)
	    (message "Wrapped: %s" (concat "_Anchor_" tag "_") )
	  )
	  (message "Couldn't find: _Anchor_%s_" tag)
      )
   )
)

(defun lenx_buffer_base()
   "return file base name of current buffer"
   (if buffer-file-name
     (file-name-nondirectory (file-name-sans-extension buffer-file-name ))
     ""
   )
)

(defun lenx_set_anchor (tag)
   "set anchor in [:_FileBase_Anchor_7_:] format at current point, by lenx"
   (interactive "sAnchor Tag:\n")
   (insert "[:_" (lenx_buffer_base) "_Anchor_" tag "_:]" )
)

; [:_lative_Anchor_5_:]
(require 'help-macro)
(make-help-screen lenx_helpscreen
  "hi, from lative keymap :)"
  "Welcome to Lative Emacs Keymap F1 F1 help screen :)
You can reach here by type F1 F1 or M-1.
\(Use SPC or DEL to scroll through this text.  Type \\<help-map>\\[help-quit] to exit the Help command.)

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
"
 help-map)

;;;;;;;;;;;;;;;;;;
;;;  set keys  ;;;
;;;;;;;;;;;;;;;;;;
; [:_lative_Anchor_5_:]

; folding
(global-set-key "\C-c\ h" 'hs-toggle-hiding)
(global-set-key "\C-c\ H" 'hs-hide-all)
(global-set-key "\C-c\ S" 'hs-show-all)
;(global-set-key "\C-\\" 'toggle-selective-display)

; using M-m to toggle font lock mode
(global-set-key [?\M-m] 'font-lock-mode)

; help keys
(global-set-key [?\M-1] 'lenx_helpscreen)
(define-key help-map [f1] 'lenx_helpscreen)
(define-key help-map [f2] 'help-for-help)

; restore C-h to backspace, use M-h to get help
(global-set-key [?\C-h] 'lenx_backspace)
;(global-set-key [del] 'lenx_backspace)
(global-set-key [?\M-h] 'help-command)
; use C-z to undo
(global-set-key [?\C-z] 'undo)
(global-set-key [?\M-z] 'undo)
(global-set-key [(control meta z)] 'suspend-emacs)
; use M-s to save file
(global-set-key [?\M-s] 'save-buffer)
; use C-x w to save as
(global-set-key "\C-x\ w" 'write-file)
; use C-x f to open file
(global-set-key "\C-x\ f" 'find-file)
; use C-. to find next tag
(global-set-key [?\C-.] 'lenx_findtag)

;;;;;;;;;;;;;;;;;;;
;  cursor moving  ;
;;;;;;;;;;;;;;;;;;;
; make direction keys more meaningful
(global-set-key [home] 'lenx_home)
(global-set-key [?\C-a] 'lenx_home)
(global-set-key [end] 'end-of-line)
(global-set-key [C-prior] 'beginning-of-buffer)
(global-set-key [C-next] 'end-of-buffer)

; for custom & in case of bad terminfo
(global-set-key [?\C-f] 'scroll-up)
(global-set-key [?\C-b] 'scroll-down)
(global-set-key [?\M-f] 'lenx_forward_word)
(global-set-key [C-right] 'lenx_forward_word)

; advanced cursor moving
(global-set-key [?\M-g] 'goto-line)
(global-set-key [?\M-r] 'point-to-register)
(global-set-key [?\M-t] 'jump-to-register)

(global-set-key [?\C-1] (lambda ()(interactive)(lenx_find_anchor "1")))
(global-set-key [(control !)] (lambda ()(interactive)(lenx_set_anchor "1")))

(global-set-key [?\C-2] (lambda ()(interactive)(lenx_find_anchor "2")))
(global-set-key [(control @)] (lambda ()(interactive)(lenx_set_anchor "2")))

(global-set-key [?\C-3] (lambda ()(interactive)(lenx_find_anchor "3")))
(global-set-key [(control \#)] (lambda ()(interactive)(lenx_set_anchor "3")))

(global-set-key [?\C-4] (lambda ()(interactive)(lenx_find_anchor "4")))
(global-set-key [(control $)] (lambda ()(interactive)(lenx_set_anchor "4")))

(global-set-key [?\C-5] (lambda ()(interactive)(lenx_find_anchor "5")))
(global-set-key [(control %)] (lambda ()(interactive)(lenx_set_anchor "5")))

(global-set-key [?\C-6] (lambda ()(interactive)(lenx_find_anchor "6")))
(global-set-key [(control ^)] (lambda ()(interactive)(lenx_set_anchor "6")))

(global-set-key [?\C-7] (lambda ()(interactive)(lenx_find_anchor "7")))
(global-set-key [(control &)] (lambda ()(interactive)(lenx_set_anchor "7")))

(global-set-key [?\C-8] (lambda ()(interactive)(lenx_find_anchor "8")))
(global-set-key [(control *)] (lambda ()(interactive)(lenx_set_anchor "8")))

(global-set-key [?\C-9] 'lenx_find_anchor)
(global-set-key [?\C-0] 'lenx_set_anchor)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  select, copy, cut & paste  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; use M-a to select all
(global-set-key [?\M-a] 'mark-whole-buffer)
; use C-v to set mark
; in case of C-SPC to activate Chinese Input Method
(global-set-key [?\C-v] 'set-mark-command)
; use M-v to paste
(global-set-key [?\M-v] 'yank)
; use M-c to copy
(global-set-key [?\M-c] 'kill-ring-save)
; use M-d to cut region, or word if there is no region
(global-set-key [?\M-d] 'lenx_delete)
; use C-d to cut region, or char if there is no region
(global-set-key [?\C-d] 'lenx_delete_char)

;;;;;;;;;;;;;;;;;;;;;;
;  window operation  ;
;;;;;;;;;;;;;;;;;;;;;;
; use M-[ & M-` to select buffer under the same window
; not the same as that C-x C-b opens a new window to show buffer list
; (global-set-key [?\M-\[] 'buffer-menu)
(global-set-key [?\M-`] 'buffer-menu)
(global-set-key [?\C-`] 'tmm-menubar)

; use M-w to show only one full window, just like C-x 1
(global-set-key [?\M-w] 'delete-other-windows)
; use M-q to close current window, just like C-x 0
(global-set-key [?\M-q] 'lenx_delete_window)
; use C-q to close window and buffer
(global-set-key [?\C-q] 'lenx_kill_window)
; use M-o to move between windows
(global-set-key [?\M-o] 'other-window)
(global-set-key [(control meta o)] 'other-window)
; use M-e to split window
(global-set-key [?\M-e] 'split-window-vertically)
; use M-n to create a new frame
;(global-set-key [?\M-n] 'make-frame-command)

;;;;;;;;;;;
;  debug  ;
;;;;;;;;;;;
; use F-keys to debug
(global-set-key [f2] 'compile)
(global-set-key [f3] 'gdb)
(global-set-key [f4] 'gud-print)
(global-set-key [f5] 'gud-cont)
(global-set-key [f6] 'gud-finish)
(global-set-key [f7] 'gud-next)
(global-set-key [f8] 'gud-step)
(global-set-key [f9] 'gud-break)
(global-set-key [f10] 'gud-remove)
(global-set-key [f11] 'gud-tbreak)
(global-set-key [f12] 'gud-stepi)

(global-set-key [?\M-2] 'compile)
(global-set-key [?\M-3] 'gdb)
(global-set-key [?\M-4] 'gud-print)
(global-set-key [?\M-5] 'gud-cont)
(global-set-key [?\M-6] 'gud-finish)
(global-set-key [?\M-7] 'gud-next)
(global-set-key [?\M-8] 'gud-step)
(global-set-key [?\M-9] 'gud-break)
(global-set-key [?\M-0] 'gud-remove)
(global-set-key [?\M--] 'gud-tbreak)
(global-set-key [?\M-=] 'gud-stepi)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  to adjust buffer menu mode  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'buffer-menu-mode-hook
        '(lambda ()
            ; use e & s / i & j to up and down
            (local-set-key [?e] 'previous-line)
            (local-set-key [?s] 'next-line)
            (local-set-key [?i] 'previous-line)
            (local-set-key [?j] 'next-line)
         )
)

;;;;;;;;;;;;;;;;;;;;;;;;
;  to adjust tcl mode  ;
;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-hook 'tcl-mode-hook
;;         '(lambda ()
;;             ; adjust C-p to buffer-menu
;;             (local-set-key [?\C-p] 'buffer-menu)
;; 	 )
;; )

;;;;;;;;;;;;;;;;;;;;;;;;;;
;  to adjust dired mode  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-hook 'dired-mode-hook
;;         '(lambda ()
;;             ; adjust C-p to buffer-menu
;;             (local-set-key [?\C-p] 'buffer-menu)
;; 	 )
;; )

;;;;;;;;;;;;;;;;;;;;;;
;  to adjust c-mode  ;
;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'c-mode-hook
        '(lambda ()
            ; override M-a & M-e
            (local-set-key [?\M-a] 'mark-whole-buffer)
            (local-set-key [?\M-e] 'split-window-vertically)
            ;(custom-set-variables
		;'(indent-tabs-mode nil)
            	;'(tab-width 4)
                ;'(c-basic-offset 4)
            ;)
	    (setq
            	indent-tabs-mode nil
		c-basic-offset 4
	    )
	    (local-set-key [f3] 'gdb)
	    (local-set-key [?\M-3] 'gdb)
        )
)

;;;;;;;;;;;;;;;;;;;;;;;;
;  to adjust c++-mode  ;
;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'c++-mode-hook
        '(lambda ()
            ; override M-a & M-e
            (local-set-key [?\M-a] 'mark-whole-buffer)
            (local-set-key [?\M-e] 'split-window-vertically)
            ;(custom-set-variables
                ;'(indent-tabs-mode nil)
		;'(tab-width 8)
                ;'(c-basic-offset 4)
		;'(c-indent-level 4)
            ;)
	    (setq
	        indent-tabs-mode nil
		c-basic-offset 4
	    )
	    (local-set-key [f3] 'gdb)
	    (local-set-key [?\M-3] 'gdb)
        )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  to adjust emacs-lisp-mode  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(add-hook 'emacs-lisp-mode-hook
;        '(lambda ()
;         )
;)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  some personal adjusts  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; fit for my notebook :>>
(global-set-key [?\M-i] 'previous-line)
(global-set-key [?\M-j] 'backward-char)
(global-set-key [?\M-k] 'next-line)
(global-set-key [?\M-l] 'forward-char)

; scrolling smoothly
(setq scroll-conservatively 10000)


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  to adjust python-mode  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'python-mode "python-mode" "Python editing mode." t)

(setq auto-mode-alist
      (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist))

(add-hook 'python-mode-hook
        '(lambda ()
	    ; adjust f3
	    (local-set-key [f3] 'pdb)
	    (local-set-key [?\M-3] 'pdb)
	 )
)

(add-hook 'pdb-mode-hook
	'(lambda ()
            ; disable pdbtrack
            (setq py-pdbtrack-do-tracking-p nil)
	    ; adjust f3
	    (local-set-key [f3] 'pdb)
	    (local-set-key [?\M-3] 'pdb)
	 )
)

;;;;;;;;;;;;;;;;;;;
;;;  perl mode  ;;;
;;;;;;;;;;;;;;;;;;;

(add-hook 'perl-mode-hook
	'(lambda ()
	    ; adjust f3
	    (local-set-key [f3] 'perldb)
	    (local-set-key [?\M-3] 'perldb)
	 )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  emacs saved options  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [:_lative_Anchor_5_:]
;
(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(save-place t nil (saveplace)))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )

