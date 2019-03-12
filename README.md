# Cool-Moves

The package gives a small subset of the features described in [this blog post](https://with-emacs.com/posts/i-like-to-move-it-emacs-version/) and in [objed mode](https://with-emacs.com/posts/i-like-to-move-it-emacs-version/), but in a way that is easier for Evil users. It works by leveraging transpose and other command Emacs basic commands. Because it uses the transpose family of commands, `cool-moves/word-forward` doesn't work in the first word of a line.

## Installation

### With use-package

Put `cool-motions.el` somewhere in your Emacs configuration folder and replace `load-path` with the path to it. Here's an example:

``` emacs-lisp
(use-package cool-moves
:load-path "~/.emacs.d/lisp/cool-moves"
:config
(general-define-key
 :keymaps 'override
"<C-down>" 'cool-moves/paragraph-forward
"<C-up>" 'cool-moves/paragraph-backward
"C-S-j" 'cool-moves/line-forward
"C-S-k" 'cool-moves/line-backward
"C-M-n" 'cool-moves/word-forward
"C-M-p" 'cool-moves/word-backwards))
```

### Without use-package

Remember to replace `~/.emacs.d/lisp/cool-moves` with the path you chose in your installation. The rest is straightforward.

``` emacs-lisp
(add-to-list 'load-path "~/.emacs.d/lisp/cool-moves")
(load "cool-moves")

(general-define-key
 :keymaps 'override
"<C-down>" 'cool-moves/paragraph-forward
"<C-up>" 'cool-moves/paragraph-backward
"C-S-j" 'cool-moves/line-forward
"C-S-k" 'cool-moves/line-backward
"C-M-n" 'cool-moves/word-forward
"C-M-p" 'cool-moves/word-backwards)
```

## Commands

Each of these commands move something either forward or backwards, and are named in predictable manner. This package have no default keybindings, but I'll make some suggestions below.

- cool-moves/character-backward
- cool-moves/character-forward
- cool-moves/line-backward
- cool-moves/line-forward
- cool-moves/paragraph-forward
- cool-moves/paragraph-backward
- cool-moves/sentence-backward
- cool-moves/sentence-forward
- cool-moves/sexp-backward
- cool-moves/sexp-forward
- cool-moves/word-backwards
- cool-moves/word-forward

# Settings

Besides the keybindings there are no settings to be made.

# Suggested Keybindings

I use the awesome [general.el](https://github.com/noctuid/general.el) for my keybindings, so:

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

If you don't use General and don't know how to create keybindings, [this article](https://www.masteringemacs.org/article/mastering-key-bindings-emacs) might be helpful.

# Suggested Hydra

You can use a [Hydra](https://github.com/abo-abo/hydra) to make the commands easily accessible.

``` emacs-lisp
(defhydra hydra-text-motions (:color amaranth :hint nil :foreign-keys nil)
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
