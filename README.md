<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [What It Does](#what-it-does)
- [Rationale](#rationale)
- [Installation](#installation)
    - [With use-package](#with-use-package)
    - [Without use-package](#without-use-package)
- [Commands](#commands)
- [Settings](#settings)
    - [Suggested Keybindings](#suggested-keybindings)
    - [Suggested Hydra](#suggested-hydra)
- [Differences from drag-stuff](#differences-from-drag-stuff)

<!-- markdown-toc end -->

# What It Does
This is a package to move text around. It uses basic functions to move words, lines, paragraphs, sentences and sexps forward and backward.

[See it in action](https://gfycat.com/ClassicUnevenEquestrian).

# Rationale
I'm an Evil user and write a lot of prose on Emacs. This package was inspired by [this](https://emacsredux.com/blog/2013/04/02/move-current-line-up-or-down/) and [this](https://with-emacs.com/posts/i-like-to-move-it-emacs-version/) blog posts. It uses basic functions to move words, lines, paragraphs, sentences, and sexps both forward and backward. Being able to quickly reorganize my prose is extremely important for me.

This is my first attempt at publishing code, so criticism is more than welcome!
# Installation
## With use-package
Put `cool-motions.el` somewhere in your Emacs path and replace `~/.emacs.d/lisp/cool-moves` with the path to it. Here's an example (the keybindings are optional):

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
## Without use-package
Remember to replace `~/.emacs.d/lisp/cool-moves`. The rest is straightforward.
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
# Commands
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
## Suggested Keybindings

I use [general.el](https://github.com/noctuid/general.el) for my keybindings, so:

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
## Suggested Hydra
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
# Differences from drag-stuff
[drag-stuff](https://github.com/rejeep/drag-stuff.el) is bigger, robuster and able to drag regions. Unlike cool-moves, it doesn't move sentences or characters. When I try to use `drag-stuff-right` on the first word of a line, it's switched with the last word of the previous paragraph. `drag-stuff` is clearly a good mode that does a lot a with a single command, but in text editing predictability is a must and I don't need the added complexity. I didn't use any code from this package. My functions were largely adapted inspired from this aforementioned [blog post](https://emacsredux.com/blog/2013/04/02/move-current-line-up-or-down/) written by Bozhidar Batsov.
