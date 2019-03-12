;;; cool-moves.el --- This package moves stuff               -*- lexical-binding: t; -*-

;; Copyright (C) 2019

;; Author: Davi Ramos <daviramos@protonmail.com>
;; Keywords: lisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;; This is a package to move text around. It uses basic functions to
;; move words, lines, paragraphs, sentences and sexps forward and
;; backward.

;;; Code:

(defun cool-moves/line-backward ()
  "Move line up."
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun cool-moves/line-forward ()
  "Move line down."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(defun cool-moves/paragraph-forward ()
  "Move paragraph down."
  (interactive)
  (transpose-paragraphs 1)
  (backward-paragraph)
  (forward-line))

(defun cool-moves/paragraph-backward ()
  "Move paragraph up."
  (interactive)
  (transpose-paragraphs -1)
  (backward-paragraph)
  (forward-line))

(defun cool-moves/word-backwards ()
  "Move word backwards."
  (interactive)
  (backward-to-word 1)
  (transpose-words 1)
  (backward-word-strictly 2))

(defun cool-moves/word-forward ()
  "Move word forward."
  (interactive)
  (forward-to-word 1)
  (transpose-words 1)
  (backward-word))

(defun cool-moves/sentence-backward ()
  "Move sentence backward."
  (interactive)
  (transpose-sentences 1)
  (backward-sentence 2))

(defun cool-moves/sentence-forward ()
  "Move sentence forward."
  (interactive)
  (forward-sentence 1)
  (transpose-sentences 1)
  (backward-sentence))

(defun cool-moves/sexp-backward ()
  "Move sexp backward."
  (interactive)
  (transpose-sexps 1)
  (backward-sexp 2))

(defun cool-moves/sexp-forward ()
  "Move sexp forward."
  (interactive)
  (forward-sexp 1)
  (transpose-sexps 1)
  (backward-sexp))

(defun cool-moves/character-backward ()
  "Move character backward."
  (interactive)
  (transpose-chars 1)
  (backward-char 2))

(defun cool-moves/character-forward ()
  "Move character forward."
  (interactive)
  (forward-char 1)
  (transpose-chars 1)
  (backward-char))

(provide 'cool-moves)

;;; cool-moves.el ends here
