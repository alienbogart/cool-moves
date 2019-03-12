# Cool-Moves

The package gives a small subset of the features described in [this blog post](https://with-emacs.com/posts/i-like-to-move-it-emacs-version/) and in [objed mode](https://with-emacs.com/posts/i-like-to-move-it-emacs-version/), but in a way that is easier for Evil users. It works by leveraging transpose and other command Emacs basic commands.

## Commands

Each one of these commands command moving something forward or backwards, and are named accordingly. This package have no default keybindings, but I'll make some suggestions below.

``` emacs-lisp
cool-moves/character-backward
cool-moves/character-forward
cool-moves/line-backward
cool-moves/line-forward
cool-moves/paragraph-forward
cool-moves/paragraph-backward
cool-moves/region-backward
cool-moves/sentence-backward
cool-moves/sentence-forward
cool-moves/sexp-backward
cool-moves/sexp-forward
cool-moves/word-backwards
cool-moves/word-forward
```

# Settings

Besides keybindings, there are no settings to be made.

# Suggested Keybindings

I use [General](https://github.com/noctuid/general.el) for my keybindings, so here you go:

``` emacs-lisp
(general-define-key
 :keymaps 'override
 "C-S-j" 'cool-moves/line-forward
 "C-M-n" 'cool-moves/word-forward
 "C-S-k" 'cool-moves/line-backward
 "C-M-p" 'cool-moves/word-backwards
 "<C-up>" 'cool-moves/paragraph-backward
 "<C-down>" 'cool-moves/paragraph-forward)
```

# Suggested Hydra

You can use a Hydra to make all the commands easily accessible.

``` emacs-lisp
(defhydra hydra-text-motions (:color amaranth :hint nil :exit nil :foreign-keys nil)
  "
  ^
       ^Motions^
       -------------------------
       _l_: line ↓      _w_: word →
       _L_: line ↑      _W_: word ←
       _p_: par  ↓      _c_: char →
       _P_: par  ↑      _C_: char ←
       _s_: sentence →  _x_: sexp →
       _S_: sentence ←  _X_: sexp ←

"

  ("<escape>" nil)
  ("u" nil)

  ("l" cool-moves/line-forward)
  ("L" cool-moves/line-backward)

  ("p" cool-moves/paragraph-forward)
  ("P" cool-moves/paragraph-backward)

  ("w" cool-moves/word-forward)
  ("W" cool-moves/word-backwards)

  ("c" cool-moves/character-forward)
  ("C" cool-moves/character-backward)

  ("s" cool-moves/sentence-forward)
  ("S" cool-moves/sentence-backward)

  ("x" cool-moves/sexp-forward)
  ("X" cool-moves/sexp-backward))
```
