;;; zweilight-theme.el --- A dark color theme for Emacs.

;; Copyright (C) 2011-2016 Bozhidar Batsov

;; Author: Philip Arvidsson <contact@philiparvidsson.com>
;; URL: http://github.com/philiparvidsson/zweilight-emacs
;; Version: 2.4

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Custom theme inspired by Hero Dark for Sublime Text.

;;; Credits:

;; This file is taken from the Zenburn theme by Bozhidar Batsov, so all
;; credits to him - I've merely modified the colors.

;;; Code:

(deftheme zweilight "The Zweilight color theme")

;;; Color Palette

(defvar zweilight-default-colors-alist
  '(("void-yellow"        . "#ffe000")
    ("void-yellow+1"      . "#efef80")
    ("void-orange"        . "#ffa500")
    ("void-blue"          . "#0bafed")
    ("void-green"         . "#65ba08")
    ("void-green+1"       . "#48BA32")
    ("void-red"           . "#E81A14")
    ("void-red-1"         . "#CF1712")
    ("void-pink"          . "#ee11dd")
    ("void-pink+1"        . "#DC8CC3")
    ("void-grey+1"        . "#656555")
    ("void-grey"          . "#4F4F4F")
    ("void-grey-1"        . "#494949")
    ("void-bg"            . "#1b1a24")
    ("void-bg+1"          . "#1f1d2e")
    ("void-bg+2"          . "#211f30")
    ("void-bg+3"          . "#252634")
    ("void-fg+1"          . "#B1B0E8")
    ("void-fg"            . "#8584ae")
    ("void-fg-1"          . "#4c406d")
    ("void-red-pastel"    . "#8C5353")
    ("void-red-pastel+1"  . "#9C6363")
    ("void-red-pastel+2"  . "#AC7373")
    ("void-red-pastel+3"  . "#BC8383")
    ("void-red-pastel+4"  . "#DCA3A3")
    ("void-cyan"          . "#b4f5fe")
    ("void-cyan-1"        . "#8CD0D3")
    ("void-cyan-2"        . "#6CA0A3")
    ("void-cyan-3"        . "#5C888B"))
  "List of Zweilight colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defvar zweilight-override-colors-alist
  '()
  "Place to override default theme colors.

You can override a subset of the theme's default colors by
defining them in this alist before loading the theme.")

(defvar zweilight-colors-alist
  (append zweilight-default-colors-alist zweilight-override-colors-alist))

(defmacro zweilight-with-color-variables (&rest body)
  "`let' bind all colors defined in `zweilight-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   zweilight-colors-alist))
     ,@body))

;;; Theme Faces
(zweilight-with-color-variables
  (custom-theme-set-faces
   'zweilight
;;;; Built-in
;;;;; basic coloring
   '(button ((t (:underline t))))
   `(link ((t (:foreground ,void-cyan :underline t :weight bold))))
   `(link-visited ((t (:foreground ,void-yellow :underline t :weight normal))))
   `(default ((t (:foreground ,void-fg :background ,void-bg))))
   `(cursor ((t (:foreground ,void-fg :background ,void-yellow))))
   `(escape-glyph ((t (:foreground ,void-cyan :bold t))))
   `(fringe ((t (:foreground ,void-fg :background ,void-bg))))
   `(header-line ((t (:foreground ,void-cyan
                                  :background ,void-blue
                                  :box (:line-width -1 :style released-button)))))
   `(highlight ((t (:background ,void-bg+3))))
   `(success ((t (:foreground ,void-fg-1 :weight bold))))
   `(warning ((t (:foreground ,void-fg :weight bold))))
   `(tooltip ((t (:foreground ,void-fg :background ,void-grey))))
;;;;; compilation
   `(compilation-column-face ((t (:foreground ,void-cyan))))
   `(compilation-enter-directory-face ((t (:foreground ,void-fg-1))))
   `(compilation-error-face ((t (:foreground ,void-red-pastel+3 :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,void-fg))))
   `(compilation-info-face ((t (:foreground ,void-cyan-1))))
   `(compilation-info ((t (:foreground ,void-yellow :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,void-fg-1))))
   `(compilation-line-face ((t (:foreground ,void-cyan))))
   `(compilation-line-number ((t (:foreground ,void-cyan))))
   `(compilation-message-face ((t (:foreground ,void-cyan-1))))
   `(compilation-warning-face ((t (:foreground ,void-fg :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,void-fg-1 :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,void-pink :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,void-cyan :weight bold))))
;;;;; completions
   `(completions-annotations ((t (:foreground ,void-grey+1))))
;;;;; grep
   `(grep-context-face ((t (:foreground ,void-fg))))
   `(grep-error-face ((t (:foreground ,void-red-pastel+3 :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,void-cyan-1))))
   `(grep-match-face ((t (:foreground ,void-fg :weight bold))))
   `(match ((t (:background ,void-blue :foreground ,void-fg :weight bold))))
;;;;; isearch
   `(isearch ((t (:foreground ,void-yellow :w eight bold :background ,void-fg))))
   `(isearch-fail ((t (:foreground ,void-fg :background ,void-red-pastel))))
   `(lazy-highlight ((t (:foreground ,void-yellow :weight bold :background ,void-bg+3))))

   `(menu ((t (:foreground ,void-fg :background ,void-bg))))
   `(minibuffer-prompt ((t (:foreground ,void-cyan))))
   `(mode-line
     ((,class (:foreground ,void-bg
               :background ,void-blue))
      (t :inverse-video t)))
   `(mode-line-buffer-id ((t (:foreground ,void-bg :weight bold))))
   `(mode-line-inactive
     ((t (:foreground ,void-fg-1
          :background ,void-bg+3))))
   `(region ((,class (:background ,void-bg+3))
             (t :inverse-video t)))
   `(secondary-selection ((t (:background ,void-fg))))
   `(trailing-whitespace ((t (:background ,void-pink))))
   `(vertical-border ((t (:foreground ,void-fg))))
;;;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,void-cyan))))
   `(font-lock-comment-face ((t (:foreground ,void-fg-1 :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,void-fg-1))))
   `(font-lock-constant-face ((t (:foreground ,void-fg))))
   `(font-lock-doc-face ((t (:foreground ,void-fg-1 :slant italic))))
   `(font-lock-function-name-face ((t (:foreground ,void-blue))))
   `(font-lock-keyword-face ((t (:foreground ,void-cyan ))))
   `(font-lock-negation-char-face ((t (:foreground ,void-cyan))))
   `(font-lock-preprocessor-face ((t (:foreground ,void-orange))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,void-cyan :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,void-fg-1 :weight bold))))
   `(font-lock-string-face ((t (:foreground ,void-pink))))
   `(font-lock-type-face ((t (:foreground ,void-green+1))))
   `(font-lock-variable-name-face ((t (:foreground ,void-blue))))
   `(font-lock-warning-face ((t (:foreground ,void-yellow :weight bold))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))
;;;;; newsticker
   `(newsticker-date-face ((t (:foreground ,void-fg))))
   `(newsticker-default-face ((t (:foreground ,void-fg))))
   `(newsticker-enclosure-face ((t (:foreground ,void-green))))
   `(newsticker-extra-face ((t (:foreground ,void-fg :height 0.8))))
   `(newsticker-feed-face ((t (:foreground ,void-fg))))
   `(newsticker-immortal-item-face ((t (:foreground ,void-fg-1))))
   `(newsticker-new-item-face ((t (:foreground ,void-cyan-1))))
   `(newsticker-obsolete-item-face ((t (:foreground ,void-pink))))
   `(newsticker-old-item-face ((t (:foreground ,void-blue))))
   `(newsticker-statistics-face ((t (:foreground ,void-fg))))
   `(newsticker-treeview-face ((t (:foreground ,void-fg))))
   `(newsticker-treeview-immortal-face ((t (:foreground ,void-fg-1))))
   `(newsticker-treeview-listwindow-face ((t (:foreground ,void-fg))))
   `(newsticker-treeview-new-face ((t (:foreground ,void-cyan-1 :weight bold))))
   `(newsticker-treeview-obsolete-face ((t (:foreground ,void-pink))))
   `(newsticker-treeview-old-face ((t (:foreground ,void-blue))))
   `(newsticker-treeview-selection-face ((t (:background ,void-blue :foreground ,void-cyan))))
;;;; Third-party
;;;;; ace-jump
   `(ace-jump-face-background
     ((t (:foreground ,void-grey+1 :background ,void-bg :inverse-video nil))))
   `(ace-jump-face-foreground
     ((t (:foreground ,void-fg-1 :background ,void-bg :inverse-video nil))))
;;;;; ace-window
   `(aw-background-face
     ((t (:foreground ,void-grey+1 :background ,void-bg :inverse-video nil))))
   `(aw-leading-char-face ((t (:inherit aw-mode-line-face))))
;;;;; android mode
   `(android-mode-debug-face ((t (:foreground ,void-bg))))
   `(android-mode-error-face ((t (:foreground ,void-fg :weight bold))))
   `(android-mode-info-face ((t (:foreground ,void-fg))))
   `(android-mode-verbose-face ((t (:foreground ,void-fg-1))))
   `(android-mode-warning-face ((t (:foreground ,void-cyan))))
;;;;; anzu
   `(anzu-mode-line ((t (:foreground ,void-orange :weight bold))))
   `(anzu-match-1 ((t (:foreground ,void-bg :background ,void-fg-1))))
   `(anzu-match-2 ((t (:foreground ,void-bg :background ,void-fg))))
   `(anzu-match-3 ((t (:foreground ,void-bg :background ,void-cyan-1))))
   `(anzu-replace-to ((t (:inherit anzu-replace-highlight :foreground ,void-cyan))))
;;;;; auctex
   `(font-latex-bold-face ((t (:inherit bold))))
   `(font-latex-warning-face ((t (:foreground nil :inherit font-lock-warning-face))))
   `(font-latex-sectioning-5-face ((t (:foreground ,void-pink :weight bold ))))
   `(font-latex-sedate-face ((t (:foreground ,void-cyan))))
   `(font-latex-italic-face ((t (:foreground ,void-orange :slant italic))))
   `(font-latex-string-face ((t (:inherit ,font-lock-string-face))))
   `(font-latex-math-face ((t (:foreground ,void-fg))))
;;;;; agda-mode
   `(agda2-highlight-keyword-face ((t (:foreground ,void-cyan :weight bold))))
   `(agda2-highlight-string-face ((t (:foreground ,void-pink))))
   `(agda2-highlight-symbol-face ((t (:foreground ,void-fg))))
   `(agda2-highlight-primitive-type-face ((t (:foreground ,void-blue))))
   `(agda2-highlight-inductive-constructor-face ((t (:foreground ,void-fg))))
   `(agda2-highlight-coinductive-constructor-face ((t (:foreground ,void-fg))))
   `(agda2-highlight-datatype-face ((t (:foreground ,void-cyan-1))))
   `(agda2-highlight-function-face ((t (:foreground ,void-cyan-1))))
   `(agda2-highlight-module-face ((t (:foreground ,void-blue))))
   `(agda2-highlight-error-face ((t (:foreground ,void-bg :background ,void-pink+1))))
   `(agda2-highlight-unsolved-meta-face ((t (:foreground ,void-bg :background ,void-pink+1))))
   `(agda2-highlight-unsolved-constraint-face ((t (:foreground ,void-bg :background ,void-pink+1))))
   `(agda2-highlight-termination-problem-face ((t (:foreground ,void-bg :background ,void-pink+1))))
   `(agda2-highlight-incomplete-pattern-face ((t (:foreground ,void-bg :background ,void-pink+1))))
   `(agda2-highlight-typechecks-face ((t (:background ,void-red-pastel))))
;;;;; auto-complete
   `(ac-candidate-face ((t (:background ,void-blue :foreground ,void-bg))))
   `(ac-selection-face ((t (:background ,void-yellow :foreground ,void-bg))))
   `(popup-tip-face ((t (:background ,void-yellow :foreground ,void-bg))))
   `(popup-scroll-bar-foreground-face ((t (:background ,void-bg))))
   `(popup-scroll-bar-background-face ((t (:background ,void-bg+3))))
   `(popup-isearch-match ((t (:background ,void-bg :foreground ,void-fg))))
;;;;; avy
   `(avy-background-face
     ((t (:foreground ,void-grey+1 :background ,void-bg :inverse-video nil))))
   `(avy-lead-face-0
     ((t (:foreground ,void-green :background ,void-bg :inverse-video nil :weight bold))))
   `(avy-lead-face-1
     ((t (:foreground ,void-cyan :background ,void-bg :inverse-video nil :weight bold))))
   `(avy-lead-face-2
     ((t (:foreground ,void-red-pastel+4 :background ,void-bg :inverse-video nil :weight bold))))
   `(avy-lead-face
     ((t (:foreground ,void-orange :background ,void-bg :inverse-video nil :weight bold))))
;;;;; company-mode
   `(company-tooltip ((t (:foreground ,void-fg :background ,void-bg+3))))
   `(company-tooltip-annotation ((t (:foreground ,void-fg :background ,void-grey))))
   `(company-tooltip-annotation-selection ((t (:foreground ,void-fg :background ,void-blue))))
   `(company-tooltip-selection ((t (:foreground ,void-bg :background ,void-blue))))
   `(company-tooltip-mouse ((t (:foreground ,void-bg :background ,void-blue))))
   `(company-tooltip-common ((t (:foreground ,void-cyan :weight bold))))
   `(company-tooltip-common-selection ((t (:foreground ,void-cyan :weight bold))))
   `(company-scrollbar-fg ((t (:background ,void-blue))))
   `(company-scrollbar-bg ((t (:background ,void-grey-1))))
   `(company-preview ((t (:background ,void-fg-1))))
   `(company-preview-common ((t (:foreground ,void-fg-1 :background ,void-blue))))
;;;;; bm
   `(bm-face ((t (:background ,void-yellow+1 :foreground ,void-bg))))
   `(bm-fringe-face ((t (:background ,void-yellow+1 :foreground ,void-bg))))
   `(bm-fringe-persistent-face ((t (:background ,void-fg-1 :foreground ,void-bg))))
   `(bm-persistent-face ((t (:background ,void-fg-1 :foreground ,void-bg))))
;;;;; cider
   `(cider-result-overlay-face ((t (:foreground ,void-grey+1 :background unspecified))))
   `(cider-enlightened-face ((t (:box (:color ,void-fg :line-width -1)))))
   `(cider-enlightened-local-face ((t (:weight bold :foreground ,void-bg))))
   `(cider-deprecated-face ((t (:background ,void-yellow))))
   `(cider-instrumented-face ((t (:box (:color ,void-pink :line-width -1)))))
   `(cider-traced-face ((t (:box (:color ,void-orange :line-width -1)))))
   `(cider-test-failure-face ((t (:background ,void-red-pastel))))
   `(cider-test-error-face ((t (:background ,void-pink+1))))
   `(cider-test-success-face ((t (:background ,void-fg-1))))
;;;;; circe
   `(circe-highlight-nick-face ((t (:foreground ,void-orange))))
   `(circe-my-message-face ((t (:foreground ,void-fg))))
   `(circe-fool-face ((t (:foreground ,void-red-pastel+4))))
   `(circe-topic-diff-removed-face ((t (:foreground ,void-pink :weight bold))))
   `(circe-originator-face ((t (:foreground ,void-fg))))
   `(circe-server-face ((t (:foreground ,void-fg-1))))
   `(circe-topic-diff-new-face ((t (:foreground ,void-fg :weight bold))))
   `(circe-prompt-face ((t (:foreground ,void-fg :background ,void-bg :weight bold))))
;;;;; context-coloring
   `(context-coloring-level-0-face ((t :foreground ,void-fg)))
   `(context-coloring-level-1-face ((t :foreground ,void-orange)))
   `(context-coloring-level-2-face ((t :foreground ,void-yellow)))
   `(context-coloring-level-3-face ((t :foreground ,void-cyan)))
   `(context-coloring-level-4-face ((t :foreground ,void-fg)))
   `(context-coloring-level-5-face ((t :foreground ,void-pink+1)))
   `(context-coloring-level-6-face ((t :foreground ,void-orange)))
   `(context-coloring-level-7-face ((t :foreground ,void-fg-1)))
   `(context-coloring-level-8-face ((t :foreground ,void-yellow)))
   `(context-coloring-level-9-face ((t :foreground ,void-red-pastel+4)))
;;;;; coq
   `(coq-solve-tactics-face ((t (:foreground nil :inherit font-lock-constant-face))))
;;;;; ctable
   `(ctbl:face-cell-select ((t (:background ,void-cyan-1 :foreground ,void-bg))))
   `(ctbl:face-continue-bar ((t (:background ,void-bg+3 :foreground ,void-bg))))
   `(ctbl:face-row-select ((t (:background ,void-orange :foreground ,void-bg))))
;;;;; diff
   `(diff-added          ((t (:background "#335533" :foreground ,void-fg-1))))
   `(diff-changed        ((t (:background "#555511" :foreground ,void-yellow+1))))
   `(diff-removed        ((t (:background "#553333" :foreground ,void-red-pastel+2))))
   `(diff-refine-added   ((t (:background "#338833" :foreground ,void-yellow))))
   `(diff-refine-change  ((t (:background "#888811" :foreground ,void-cyan))))
   `(diff-refine-removed ((t (:background "#883333" :foreground ,void-pink))))
   `(diff-header ((,class (:background ,void-fg))
                  (t (:background ,void-fg :foreground ,void-bg))))
   `(diff-file-header
     ((,class (:background ,void-fg :foreground ,void-fg :bold t))
      (t (:background ,void-fg :foreground ,void-bg :bold t))))
;;;;; diff-hl
   `(diff-hl-change ((,class (:foreground ,void-cyan-1 :background ,void-cyan-2))))
   `(diff-hl-delete ((,class (:foreground ,void-red-pastel+4 :background ,void-red-pastel+3))))
   `(diff-hl-insert ((,class (:foreground ,void-bg :background ,void-fg-1))))
;;;;; dim-autoload
   `(dim-autoload-cookie-line ((t :foreground ,void-grey)))
;;;;; dired+
   `(diredp-display-msg ((t (:foreground ,void-cyan-1))))
   `(diredp-compressed-file-suffix ((t (:foreground ,void-fg))))
   `(diredp-date-time ((t (:foreground ,void-pink+1))))
   `(diredp-deletion ((t (:foreground ,void-cyan))))
   `(diredp-deletion-file-name ((t (:foreground ,void-pink))))
   `(diredp-dir-heading ((t (:foreground ,void-cyan-1 :background ,void-blue))))
   `(diredp-dir-priv ((t (:foreground ,void-orange))))
   `(diredp-exec-priv ((t (:foreground ,void-pink))))
   `(diredp-executable-tag ((t (:foreground ,void-bg))))
   `(diredp-file-name ((t (:foreground ,void-cyan-1))))
   `(diredp-file-suffix ((t (:foreground ,void-fg-1))))
   `(diredp-flag-mark ((t (:foreground ,void-cyan))))
   `(diredp-flag-mark-line ((t (:foreground ,void-fg))))
   `(diredp-ignored-file-name ((t (:foreground ,void-pink))))
   `(diredp-link-priv ((t (:foreground ,void-cyan))))
   `(diredp-mode-line-flagged ((t (:foreground ,void-cyan))))
   `(diredp-mode-line-marked ((t (:foreground ,void-fg))))
   `(diredp-no-priv ((t (:foreground ,void-fg))))
   `(diredp-number ((t (:foreground ,void-bg))))
   `(diredp-other-priv ((t (:foreground ,void-yellow+1))))
   `(diredp-rare-priv ((t (:foreground ,void-red-pastel+3))))
   `(diredp-read-priv ((t (:foreground ,void-fg-1))))
   `(diredp-symlink ((t (:foreground ,void-cyan))))
   `(diredp-write-priv ((t (:foreground ,void-pink+1))))
;;;;; dired-async
   `(dired-async-failures ((t (:foreground ,void-pink :weight bold))))
   `(dired-async-message ((t (:foreground ,void-cyan :weight bold))))
   `(dired-async-mode-message ((t (:foreground ,void-cyan))))
;;;;; ediff
   `(ediff-current-diff-A ((t (:foreground ,void-fg :background ,void-red-pastel))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,void-fg :background ,void-red-pastel))))
   `(ediff-current-diff-B ((t (:foreground ,void-fg :background ,void-fg-1))))
   `(ediff-current-diff-C ((t (:foreground ,void-fg :background ,void-bg))))
   `(ediff-even-diff-A ((t (:background ,void-grey))))
   `(ediff-even-diff-Ancestor ((t (:background ,void-grey))))
   `(ediff-even-diff-B ((t (:background ,void-grey))))
   `(ediff-even-diff-C ((t (:background ,void-grey))))
   `(ediff-fine-diff-A ((t (:foreground ,void-fg :background ,void-red-pastel+2 :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,void-fg :background ,void-red-pastel+2 weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,void-fg :background ,void-fg-1 :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,void-fg :background ,void-cyan-3 :weight bold ))))
   `(ediff-odd-diff-A ((t (:background ,void-fg))))
   `(ediff-odd-diff-Ancestor ((t (:background ,void-fg))))
   `(ediff-odd-diff-B ((t (:background ,void-fg))))
   `(ediff-odd-diff-C ((t (:background ,void-fg))))
;;;;; egg
   `(egg-text-base ((t (:foreground ,void-fg))))
   `(egg-help-header-1 ((t (:foreground ,void-cyan))))
   `(egg-help-header-2 ((t (:foreground ,void-green))))
   `(egg-branch ((t (:foreground ,void-cyan))))
   `(egg-branch-mono ((t (:foreground ,void-cyan))))
   `(egg-term ((t (:foreground ,void-cyan))))
   `(egg-diff-add ((t (:foreground ,void-yellow))))
   `(egg-diff-del ((t (:foreground ,void-red-pastel+4))))
   `(egg-diff-file-header ((t (:foreground ,void-yellow))))
   `(egg-section-title ((t (:foreground ,void-cyan))))
   `(egg-stash-mono ((t (:foreground ,void-yellow))))
;;;;; elfeed
   `(elfeed-log-error-level-face ((t (:foreground ,void-pink))))
   `(elfeed-log-info-level-face ((t (:foreground ,void-cyan-1))))
   `(elfeed-log-warn-level-face ((t (:foreground ,void-cyan))))
   `(elfeed-search-date-face ((t (:foreground ,void-yellow+1 :underline t
                                              :weight bold))))
   `(elfeed-search-tag-face ((t (:foreground ,void-fg-1))))
   `(elfeed-search-feed-face ((t (:foreground ,void-orange))))
;;;;; emacs-w3m
   `(w3m-anchor ((t (:foreground ,void-cyan :underline t
                                 :weight bold))))
   `(w3m-arrived-anchor ((t (:foreground ,void-yellow
                                         :underline t :weight normal))))
   `(w3m-form ((t (:foreground ,void-red-pastel+3 :underline t))))
   `(w3m-header-line-location-title ((t (:foreground ,void-cyan
                                                     :underline t :weight bold))))
   '(w3m-history-current-url ((t (:inherit match))))
   `(w3m-lnum ((t (:foreground ,void-fg-1 :background ,void-bg))))
   `(w3m-lnum-match ((t (:background ,void-blue
                                     :foreground ,void-fg
                                     :weight bold))))
   `(w3m-lnum-minibuffer-prompt ((t (:foreground ,void-cyan))))
;;;;; erc
   `(erc-action-face ((t (:inherit erc-default-face))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,void-cyan-1 :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
   `(erc-default-face ((t (:foreground ,void-fg))))
   `(erc-direct-msg-face ((t (:inherit erc-default-face))))
   `(erc-error-face ((t (:inherit font-lock-warning-face))))
   `(erc-fool-face ((t (:inherit erc-default-face))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,void-cyan))))
   `(erc-keyword-face ((t (:foreground ,void-cyan-1 :weight bold))))
   `(erc-nick-default-face ((t (:foreground ,void-cyan :weight bold))))
   `(erc-my-nick-face ((t (:foreground ,void-pink :weight bold))))
   `(erc-nick-msg-face ((t (:inherit erc-default-face))))
   `(erc-notice-face ((t (:foreground ,void-fg-1))))
   `(erc-pal-face ((t (:foreground ,void-fg :weight bold))))
   `(erc-prompt-face ((t (:foreground ,void-fg :background ,void-bg :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,void-yellow))))
   `(erc-underline-face ((t (:underline t))))
;;;;; ert
   `(ert-test-result-expected ((t (:foreground ,void-yellow :background ,void-bg))))
   `(ert-test-result-unexpected ((t (:foreground ,void-pink :background ,void-bg))))
;;;;; eshell
   `(eshell-prompt ((t (:foreground ,void-cyan :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,void-red-pastel+3 :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,void-orange :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,void-red-pastel+4 :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,void-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,void-cyan :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,void-orange :weight bold))))
;;;;; flx
   `(flx-highlight-face ((t (:foreground ,void-fg-1 :weight bold))))
;;;;; flycheck
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-red-pastel+3) :inherit unspecified))
      (t (:foreground ,void-red-pastel+3 :weight bold :underline t))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-cyan) :inherit unspecified))
      (t (:foreground ,void-cyan :weight bold :underline t))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-orange) :inherit unspecified))
      (t (:foreground ,void-orange :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,void-red-pastel+3 :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,void-cyan :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,void-orange :weight bold))))
;;;;; flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-pink)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,void-red-pastel+3 :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-fg)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,void-fg :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-fg-1)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,void-fg-1 :weight bold :underline t))))
;;;;; flyspell
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-fg) :inherit unspecified))
      (t (:foreground ,void-fg :weight bold :underline t))))
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-pink) :inherit unspecified))
      (t (:foreground ,void-red-pastel+3 :weight bold :underline t))))
;;;;; full-ack
   `(ack-separator ((t (:foreground ,void-fg))))
   `(ack-file ((t (:foreground ,void-cyan-1))))
   `(ack-line ((t (:foreground ,void-cyan))))
   `(ack-match ((t (:foreground ,void-fg :background ,void-blue :weight bold))))
;;;;; git-commit
   `(git-commit-comment-action  ((,class (:foreground ,void-bg :weight bold))))
   `(git-commit-comment-branch  ((,class (:foreground ,void-orange  :weight bold))))
   `(git-commit-comment-heading ((,class (:foreground ,void-cyan  :weight bold))))
;;;;; git-gutter
   `(git-gutter:added ((t (:foreground ,void-fg-1 :weight bold :inverse-video t))))
   `(git-gutter:deleted ((t (:foreground ,void-pink :weight bold :inverse-video t))))
   `(git-gutter:modified ((t (:foreground ,void-pink+1 :weight bold :inverse-video t))))
   `(git-gutter:unchanged ((t (:foreground ,void-fg :weight bold :inverse-video t))))
;;;;; git-gutter-fr
   `(git-gutter-fr:added ((t (:foreground ,void-fg-1  :weight bold))))
   `(git-gutter-fr:deleted ((t (:foreground ,void-pink :weight bold))))
   `(git-gutter-fr:modified ((t (:foreground ,void-pink+1 :weight bold))))
;;;;; git-rebase
   `(git-rebase-hash ((t (:foreground, void-fg))))
;;;;; gnus
   `(gnus-group-mail-1 ((t (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((t (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((t (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((t (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((t (:bold t :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((t (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((t (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((t (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((t (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((t (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((t (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((t (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((t (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((t (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((t (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((t (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((t (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((t (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((t (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((t (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((t (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((t (:inherit message-header-other))))
   `(gnus-header-from ((t (:inherit message-header-to))))
   `(gnus-header-name ((t (:inherit message-header-name))))
   `(gnus-header-newsgroups ((t (:inherit message-header-other))))
   `(gnus-header-subject ((t (:inherit message-header-subject))))
   `(gnus-server-opened ((t (:foreground ,void-fg-1 :weight bold))))
   `(gnus-server-denied ((t (:foreground ,void-red-pastel+4 :weight bold))))
   `(gnus-server-closed ((t (:foreground ,void-cyan-1 :slant italic))))
   `(gnus-server-offline ((t (:foreground ,void-cyan :weight bold))))
   `(gnus-server-agent ((t (:foreground ,void-cyan-1 :weight bold))))
   `(gnus-summary-cancelled ((t (:foreground ,void-fg))))
   `(gnus-summary-high-ancient ((t (:foreground ,void-cyan-1))))
   `(gnus-summary-high-read ((t (:foreground ,void-fg-1 :weight bold))))
   `(gnus-summary-high-ticked ((t (:foreground ,void-fg :weight bold))))
   `(gnus-summary-high-unread ((t (:foreground ,void-fg :weight bold))))
   `(gnus-summary-low-ancient ((t (:foreground ,void-cyan-1))))
   `(gnus-summary-low-read ((t (:foreground ,void-fg-1))))
   `(gnus-summary-low-ticked ((t (:foreground ,void-fg :weight bold))))
   `(gnus-summary-low-unread ((t (:foreground ,void-fg))))
   `(gnus-summary-normal-ancient ((t (:foreground ,void-cyan-1))))
   `(gnus-summary-normal-read ((t (:foreground ,void-fg-1))))
   `(gnus-summary-normal-ticked ((t (:foreground ,void-fg :weight bold))))
   `(gnus-summary-normal-unread ((t (:foreground ,void-fg))))
   `(gnus-summary-selected ((t (:foreground ,void-cyan :weight bold))))
   `(gnus-cite-1 ((t (:foreground ,void-cyan-1))))
   `(gnus-cite-10 ((t (:foreground ,void-yellow+1))))
   `(gnus-cite-11 ((t (:foreground ,void-cyan))))
   `(gnus-cite-2 ((t (:foreground ,void-blue))))
   `(gnus-cite-3 ((t (:foreground ,void-cyan-2))))
   `(gnus-cite-4 ((t (:foreground ,void-fg-1))))
   `(gnus-cite-5 ((t (:foreground ,void-bg))))
   `(gnus-cite-6 ((t (:foreground ,void-fg-1))))
   `(gnus-cite-7 ((t (:foreground ,void-pink))))
   `(gnus-cite-8 ((t (:foreground ,void-red-pastel+3))))
   `(gnus-cite-9 ((t (:foreground ,void-red-pastel+2))))
   `(gnus-group-news-1-empty ((t (:foreground ,void-cyan))))
   `(gnus-group-news-2-empty ((t (:foreground ,void-green))))
   `(gnus-group-news-3-empty ((t (:foreground ,void-bg))))
   `(gnus-group-news-4-empty ((t (:foreground ,void-cyan-2))))
   `(gnus-group-news-5-empty ((t (:foreground ,void-cyan-3))))
   `(gnus-group-news-6-empty ((t (:foreground ,void-fg))))
   `(gnus-group-news-low-empty ((t (:foreground ,void-fg))))
   `(gnus-signature ((t (:foreground ,void-cyan))))
   `(gnus-x ((t (:background ,void-fg :foreground ,void-bg))))
;;;;; guide-key
   `(guide-key/highlight-command-face ((t (:foreground ,void-cyan-1))))
   `(guide-key/key-face ((t (:foreground ,void-fg-1))))
   `(guide-key/prefix-command-face ((t (:foreground ,void-bg))))
;;;;; helm
   `(helm-header
     ((t (:foreground ,void-fg-1
          :background ,void-bg
          :underline nil
          :box nil))))
   `(helm-source-header
     ((t (:foreground ,void-cyan
          ;; :background ,void-blue
          :underline nil
          :weight bold
          ;; :box (:line-width -1 :style released-button)
          :box nil))))
   `(helm-selection ((t (:background ,void-bg+3 :underline nil))))
   `(helm-selection-line ((t (:background ,void-grey))))
   `(helm-visible-mark ((t (:foreground ,void-bg :background ,void-yellow))))
   `(helm-candidate-number ((t (:foreground nil :background nil))))
   `(helm-separator ((t (:foreground ,void-pink :background ,void-bg))))
   `(helm-time-zone-current ((t (:foreground ,void-fg-1 :background ,void-bg))))
   `(helm-time-zone-home ((t (:foreground ,void-pink :background ,void-bg))))
   `(helm-bookmark-addressbook ((t (:foreground ,void-fg :background ,void-bg))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,void-pink+1 :background ,void-bg))))
   `(helm-bookmark-info ((t (:foreground ,void-fg-1 :background ,void-bg))))
   `(helm-bookmark-man ((t (:foreground ,void-cyan :background ,void-bg))))
   `(helm-bookmark-w3m ((t (:foreground ,void-pink+1 :background ,void-bg))))
   `(helm-buffer-not-saved ((t (:foreground ,void-pink :background ,void-bg))))
   `(helm-buffer-process ((t (:foreground ,void-orange :background ,void-bg))))
   `(helm-buffer-saved-out ((t (:foreground ,void-fg :background ,void-bg))))
   `(helm-buffer-size ((t (:foreground ,void-grey+1 :background ,void-bg))))
   `(helm-ff-directory ((t (:foreground ,void-cyan :background ,void-bg))))
   `(helm-ff-file ((t (:foreground ,void-fg :background ,void-bg :weight normal))))
   `(helm-ff-dotted-directory ((t (:foreground ,void-fg-1 :background ,void-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,void-green+1 :background ,void-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,void-red :background ,void-bg :slant italic))))
   `(helm-ff-symlink ((t (:foreground ,void-fg :background ,void-bg :slant italic))))
   `(helm-ff-prefix ((t (:foreground ,void-bg :background ,void-cyan :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,void-orange :background ,void-bg))))
   `(helm-grep-file ((t (:foreground ,void-fg :background ,void-bg))))
   `(helm-grep-finish ((t (:foreground ,void-fg-1 :background ,void-bg))))
   `(helm-grep-lineno ((t (:foreground ,void-grey+1 :background ,void-bg))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,void-pink :background ,void-bg))))
   `(helm-match ((t (:foreground ,void-cyan :weight bold))))
   `(helm-moccur-buffer ((t (:foreground ,void-orange :background ,void-bg))))
   `(helm-mu-contacts-address-face ((t (:foreground ,void-grey+1 :background ,void-bg))))
   `(helm-mu-contacts-name-face ((t (:foreground ,void-fg :background ,void-bg))))
;;;;; helm-swoop
   `(helm-swoop-target-line-face ((t (:foreground ,void-fg :background ,void-grey))))
   `(helm-swoop-target-word-face ((t (:foreground ,void-cyan :background ,void-fg :weight bold))))
;;;;; hl-line-mode
   `(hl-line-face ((,class (:background ,void-bg+3))
                   (t :weight bold)))
   `(hl-line ((,class (:background ,void-bg+3)) ; old emacsen
              (t :weight bold)))
;;;;; hl-sexp
   `(hl-sexp-face ((,class (:background ,void-grey))
                   (t :weight bold)))
;;;;; hydra
   `(hydra-face-red ((t (:foreground ,void-red-pastel+3 :background ,void-bg))))
   `(hydra-face-amaranth ((t (:foreground ,void-red-pastel+1 :background ,void-bg))))
   `(hydra-face-blue ((t (:foreground ,void-cyan-1 :background ,void-bg))))
   `(hydra-face-pink ((t (:foreground ,void-pink+1 :background ,void-bg))))
   `(hydra-face-teal ((t (:foreground ,void-orange :background ,void-bg))))
;;;; ivy
   `(ivy-confirm-face ((t (:foreground ,void-fg-1 :background ,void-bg))))
   `(ivy-match-required-face ((t (:foreground ,void-pink :background ,void-bg))))
   `(ivy-remote ((t (:foreground ,void-cyan-1 :background ,void-bg))))
   `(ivy-subdir ((t (:foreground ,void-cyan :background ,void-bg))))
   `(ivy-current-match ((t (:foreground ,void-cyan :weight bold :underline t))))
   `(ivy-minibuffer-match-face-1 ((t (:background ,void-grey))))
   `(ivy-minibuffer-match-face-2 ((t (:background ,void-fg-1))))
   `(ivy-minibuffer-match-face-3 ((t (:background ,void-fg-1))))
   `(ivy-minibuffer-match-face-4 ((t (:background ,void-bg))))
;;;;; ido-mode
   `(ido-first-match ((t (:foreground ,void-cyan :weight bold))))
   `(ido-only-match ((t (:foreground ,void-fg :weight bold))))
   `(ido-subdir ((t (:foreground ,void-cyan))))
   `(ido-indicator ((t (:foreground ,void-cyan :background ,void-red-pastel))))
;;;;; iedit-mode
   `(iedit-occurrence ((t (:background ,void-fg :weight bold))))
;;;;; jabber-mode
   `(jabber-roster-user-away ((t (:foreground ,void-fg-1))))
   `(jabber-roster-user-online ((t (:foreground ,void-blue))))
   `(jabber-roster-user-dnd ((t (:foreground ,void-red-pastel+4))))
   `(jabber-roster-user-xa ((t (:foreground ,void-pink+1))))
   `(jabber-roster-user-chatty ((t (:foreground ,void-fg))))
   `(jabber-roster-user-error ((t (:foreground ,void-red-pastel+4))))
   `(jabber-rare-time-face ((t (:foreground ,void-bg))))
   `(jabber-chat-prompt-local ((t (:foreground ,void-blue))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,void-red-pastel+4))))
   `(jabber-chat-prompt-system ((t (:foreground ,void-green))))
   `(jabber-activity-face((t (:foreground ,void-red-pastel+4))))
   `(jabber-activity-personal-face ((t (:foreground ,void-orange))))
   `(jabber-title-small ((t (:height 1.1 :weight bold))))
   `(jabber-title-medium ((t (:height 1.2 :weight bold))))
   `(jabber-title-large ((t (:height 1.3 :weight bold))))
;;;;; js2-mode
   `(js2-warning ((t (:underline ,void-fg))))
   `(js2-error ((t (:foreground ,void-pink :weight bold))))
   `(js2-jsdoc-tag ((t (:foreground ,void-fg-1))))
   `(js2-jsdoc-type ((t (:foreground ,void-fg-1))))
   `(js2-jsdoc-value ((t (:foreground ,void-green))))
   `(js2-function-param ((t (:foreground, void-fg))))
   `(js2-external-variable ((t (:foreground ,void-fg))))
;;;;; additional js2 mode attributes for better syntax highlighting
   `(js2-instance-member ((t (:foreground ,void-fg-1))))
   `(js2-jsdoc-html-tag-delimiter ((t (:foreground ,void-fg))))
   `(js2-jsdoc-html-tag-name ((t (:foreground ,void-red-pastel+3))))
   `(js2-object-property ((t (:foreground ,void-orange))))
   `(js2-magic-paren ((t (:foreground ,void-bg))))
   `(js2-private-function-call ((t (:foreground ,void-orange))))
   `(js2-function-call ((t (:foreground ,void-orange))))
   `(js2-private-member ((t (:foreground ,void-blue))))
   `(js2-keywords ((t (:foreground ,void-pink+1))))
;;;;; ledger-mode
   `(ledger-font-payee-uncleared-face ((t (:foreground ,void-red-pastel+3 :weight bold))))
   `(ledger-font-payee-cleared-face ((t (:foreground ,void-fg :weight normal))))
   `(ledger-font-xact-highlight-face ((t (:background ,void-grey))))
   `(ledger-font-pending-face ((t (:foreground ,void-fg weight: normal))))
   `(ledger-font-other-face ((t (:foreground ,void-fg))))
   `(ledger-font-posting-account-face ((t (:foreground ,void-blue))))
   `(ledger-font-posting-account-cleared-face ((t (:foreground ,void-fg))))
   `(ledger-font-posting-account-pending-face ((t (:foreground ,void-fg))))
   `(ledger-font-posting-amount-face ((t (:foreground ,void-fg))))
   `(ledger-occur-narrowed-face ((t (:foreground ,void-grey+1 :invisible t))))
   `(ledger-occur-xact-face ((t (:background ,void-grey))))
   `(ledger-font-comment-face ((t (:foreground ,void-fg-1))))
   `(ledger-font-reconciler-uncleared-face ((t (:foreground ,void-red-pastel+3 :weight bold))))
   `(ledger-font-reconciler-cleared-face ((t (:foreground ,void-fg :weight normal))))
   `(ledger-font-reconciler-pending-face ((t (:foreground ,void-fg :weight normal))))
   `(ledger-font-report-clickable-face ((t (:foreground ,void-fg :weight normal))))
;;;;; linum-mode
   `(linum ((t (:foreground ,void-fg-1 :background ,void-bg))))
;;;;; lispy
   `(lispy-command-name-face ((t (:background ,void-bg+3 :inherit font-lock-function-name-face))))
   `(lispy-cursor-face ((t (:foreground ,void-bg :background ,void-fg))))
   `(lispy-face-hint ((t (:inherit highlight :foreground ,void-cyan))))
;;;;; ruler-mode
   `(ruler-mode-column-number ((t (:inherit 'ruler-mode-default :foreground ,void-fg))))
   `(ruler-mode-fill-column ((t (:inherit 'ruler-mode-default :foreground ,void-cyan))))
   `(ruler-mode-goal-column ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-comment-column ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-tab-stop ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-current-column ((t (:foreground ,void-cyan :box t))))
   `(ruler-mode-default ((t (:foreground ,void-fg-1 :background ,void-bg))))

;;;;; lui
   `(lui-time-stamp-face ((t (:foreground ,void-blue))))
   `(lui-hilight-face ((t (:foreground ,void-fg-1 :background ,void-bg))))
   `(lui-button-face ((t (:inherit hover-highlight))))
;;;;; macrostep
   `(macrostep-gensym-1
     ((t (:foreground ,void-fg-1 :background ,void-blue))))
   `(macrostep-gensym-2
     ((t (:foreground ,void-red-pastel+4 :background ,void-blue))))
   `(macrostep-gensym-3
     ((t (:foreground ,void-orange :background ,void-blue))))
   `(macrostep-gensym-4
     ((t (:foreground ,void-pink+1 :background ,void-blue))))
   `(macrostep-gensym-5
     ((t (:foreground ,void-cyan :background ,void-blue))))
   `(macrostep-expansion-highlight-face
     ((t (:inherit highlight))))
   `(macrostep-macro-face
     ((t (:underline t))))
;;;;; magit
;;;;;; headings and diffs`(magit-section-highlight           ((t (:background ,void-grey-1   `(magit-section-heading             ((t (:foreground ,void-cyan :weight bold))))
   `(magit-section-heading-selection   ((t (:foreground ,void-fg :weight bold))))
   `(magit-diff-file-headi         ((t (:weight bold))))
   `(magit-diff-file-headiighlight ((t (:background ,void-grey-1 bold))))
   `(magit-diff-file-heading-selection ((t (:background ,void-grey-1                                                    :foreground ,void-fg :weight bold))))
   `(magit-diff-hunk-heading           ((t (:background ,void-grey))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,void-fg))))
   `(magit-diff-hunk-heading-selection ((t (:background ,void-fg
                                                        :foreground ,void-fg))))
   `(magit-diff-lines-heading          ((t (:background ,void-fg
                                                    :foreground ,void-fg))))
   `(magit-diff-context-highlight      ((t (:background ,void-grey-1                                                    :foreground "grey70"))))
   `(magit-diffstat-added   ((t (:foreground ,void-yellow))))
   `(magit-diffstat-removed ((t (:foreground ,void-pink))))
;;;;;; popup
   `(magit-popup-heading             ((t (:foreground ,void-cyan  :weight bold))))
   `(magit-popup-key                 ((t (:foreground ,void-fg-1 :weight bold))))
   `(magit-popup-argument            ((t (:foreground ,void-fg-1   :weight bold))))
   `(magit-popup-disabled-argument   ((t (:foreground ,void-grey+1    :weight normal))))
   `(magit-popup-option-value        ((t (:foreground ,void-cyan-2  :weight bold))))
;;;;;; process
   `(magit-process-ok    ((t (:foreground ,void-fg-1  :weight bold))))
   `(magit-process-ng    ((t (:foreground ,void-pink    :weight bold))))
;;;;;; log
   `(magit-log-author    ((t (:foreground ,void-fg))))
   `(magit-log-date      ((t (:foreground ,void-grey+1))))
   `(magit-log-graph     ((t (:foreground ,void-yellow))))
;;;;;; sequence
   `(magit-sequence-pick ((t (:foreground ,void-yellow))))
   `(magit-sequence-stop ((t (:foreground ,void-fg-1))))
   `(magit-sequence-part ((t (:foreground ,void-cyan))))
   `(magit-sequence-head ((t (:foreground ,void-cyan-1))))
   `(magit-sequence-drop ((t (:foreground ,void-pink))))
   `(magit-sequence-done ((t (:foreground ,void-grey+1))))
   `(magit-sequence-onto ((t (:foreground ,void-grey+1))))
;;;;;; bisect
   `(magit-bisect-good ((t (:foreground ,void-fg-1))))
   `(magit-bisect-skip ((t (:foreground ,void-cyan))))
   `(magit-bisect-bad  ((t (:foreground ,void-pink))))
;;;;;; blame
   `(magit-blame-heading ((t (:background ,void-blue :foreground ,void-cyan-2))))
   `(magit-blame-hash    ((t (:background ,void-blue :foreground ,void-cyan-2))))
   `(magit-blame-name    ((t (:background ,void-blue :foreground ,void-fg))))
   `(magit-blame-date    ((t (:background ,void-blue :foreground ,void-fg))))
   `(magit-blame-summary ((t (:background ,void-blue :foreground ,void-cyan-2
                                          :weight bold))))
;;;;;; references etc
   `(magit-dimmed         ((t (:foreground ,void-blue))))
   `(magit-hash           ((t (:foreground ,void-blue))))
   `(magit-tag            ((t (:foreground ,void-fg :weight bold))))
   `(magit-branch-remote  ((t (:foreground ,void-fg-1  :weight bold))))
   `(magit-branch-local   ((t (:foreground ,void-cyan-1   :weight bold))))
   `(magit-branch-current ((t (:foreground ,void-cyan-1   :weight bold :box t))))
   `(magit-head           ((t (:foreground ,void-cyan-1   :weight bold))))
   `(magit-refname        ((t (:background ,void-fg :foreground ,void-fg :weight bold))))
   `(magit-refname-stash  ((t (:background ,void-fg :foreground ,void-fg :weight bold))))
   `(magit-refname-wip    ((t (:background ,void-fg :foreground ,void-fg :weight bold))))
   `(magit-signature-good      ((t (:foreground ,void-fg-1))))
   `(magit-signature-bad       ((t (:foreground ,void-pink))))
   `(magit-signature-untrusted ((t (:foreground ,void-cyan))))
   `(magit-cherry-unmatched    ((t (:foreground ,void-orange))))
   `(magit-cherry-equivalent   ((t (:foreground ,void-pink+1))))
   `(magit-reflog-commit       ((t (:foreground ,void-fg-1))))
   `(magit-reflog-amend        ((t (:foreground ,void-pink+1))))
   `(magit-reflog-merge        ((t (:foreground ,void-fg-1))))
   `(magit-reflog-checkout     ((t (:foreground ,void-cyan-1))))
   `(magit-reflog-reset        ((t (:foreground ,void-pink))))
   `(magit-reflog-rebase       ((t (:foreground ,void-pink+1))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,void-fg-1))))
   `(magit-reflog-remote       ((t (:foreground ,void-orange))))
   `(magit-reflog-other        ((t (:foreground ,void-orange))))
;;;;; message-mode
   `(message-cited-text ((t (:inherit font-lock-comment-face))))
   `(message-header-name ((t (:foreground ,void-bg))))
   `(message-header-other ((t (:foreground ,void-fg-1))))
   `(message-header-to ((t (:foreground ,void-cyan :weight bold))))
   `(message-header-cc ((t (:foreground ,void-cyan :weight bold))))
   `(message-header-newsgroups ((t (:foreground ,void-cyan :weight bold))))
   `(message-header-subject ((t (:foreground ,void-fg :weight bold))))
   `(message-header-xheader ((t (:foreground ,void-fg-1))))
   `(message-mml ((t (:foreground ,void-cyan :weight bold))))
   `(message-separator ((t (:inherit font-lock-comment-face))))
;;;;; mew
   `(mew-face-header-subject ((t (:foreground ,void-fg))))
   `(mew-face-header-from ((t (:foreground ,void-cyan))))
   `(mew-face-header-date ((t (:foreground ,void-fg-1))))
   `(mew-face-header-to ((t (:foreground ,void-pink))))
   `(mew-face-header-key ((t (:foreground ,void-fg-1))))
   `(mew-face-header-private ((t (:foreground ,void-fg-1))))
   `(mew-face-header-important ((t (:foreground ,void-cyan-1))))
   `(mew-face-header-marginal ((t (:foreground ,void-fg :weight bold))))
   `(mew-face-header-warning ((t (:foreground ,void-pink))))
   `(mew-face-header-xmew ((t (:foreground ,void-fg-1))))
   `(mew-face-header-xmew-bad ((t (:foreground ,void-pink))))
   `(mew-face-body-url ((t (:foreground ,void-fg))))
   `(mew-face-body-comment ((t (:foreground ,void-fg :slant italic))))
   `(mew-face-body-cite1 ((t (:foreground ,void-fg-1))))
   `(mew-face-body-cite2 ((t (:foreground ,void-cyan-1))))
   `(mew-face-body-cite3 ((t (:foreground ,void-fg))))
   `(mew-face-body-cite4 ((t (:foreground ,void-cyan))))
   `(mew-face-body-cite5 ((t (:foreground ,void-pink))))
   `(mew-face-mark-review ((t (:foreground ,void-cyan-1))))
   `(mew-face-mark-escape ((t (:foreground ,void-fg-1))))
   `(mew-face-mark-delete ((t (:foreground ,void-pink))))
   `(mew-face-mark-unlink ((t (:foreground ,void-cyan))))
   `(mew-face-mark-refile ((t (:foreground ,void-fg-1))))
   `(mew-face-mark-unread ((t (:foreground ,void-red-pastel+2))))
   `(mew-face-eof-message ((t (:foreground ,void-fg-1))))
   `(mew-face-eof-part ((t (:foreground ,void-cyan))))
;;;;; mic-paren
   `(paren-face-match ((t (:foreground ,void-orange :background ,void-bg :weight bold))))
   `(paren-face-mismatch ((t (:foreground ,void-bg :background ,void-pink+1 :weight bold))))
   `(paren-face-no-match ((t (:foreground ,void-bg :background ,void-pink :weight bold))))
;;;;; mingus
   `(mingus-directory-face ((t (:foreground ,void-cyan-1))))
   `(mingus-pausing-face ((t (:foreground ,void-pink+1))))
   `(mingus-playing-face ((t (:foreground ,void-orange))))
   `(mingus-playlist-face ((t (:foreground ,void-orange ))))
   `(mingus-song-file-face ((t (:foreground ,void-cyan))))
   `(mingus-stopped-face ((t (:foreground ,void-pink))))
;;;;; nav
   `(nav-face-heading ((t (:foreground ,void-cyan))))
   `(nav-face-button-num ((t (:foreground ,void-orange))))
   `(nav-face-dir ((t (:foreground ,void-fg-1))))
   `(nav-face-hdir ((t (:foreground ,void-pink))))
   `(nav-face-file ((t (:foreground ,void-fg))))
   `(nav-face-hfile ((t (:foreground ,void-red-pastel))))
;;;;; mu4e
   `(mu4e-cited-1-face ((t (:foreground ,void-cyan-1    :slant italic))))
   `(mu4e-cited-2-face ((t (:foreground ,void-fg-1 :slant italic))))
   `(mu4e-cited-3-face ((t (:foreground ,void-cyan-2  :slant italic))))
   `(mu4e-cited-4-face ((t (:foreground ,void-fg-1   :slant italic))))
   `(mu4e-cited-5-face ((t (:foreground ,void-yellow  :slant italic))))
   `(mu4e-cited-6-face ((t (:foreground ,void-fg-1 :slant italic))))
   `(mu4e-cited-7-face ((t (:foreground ,void-cyan-1    :slant italic))))
   `(mu4e-replied-face ((t (:foreground ,void-blue))))
   `(mu4e-trashed-face ((t (:foreground ,void-blue :strike-through t))))
;;;;; mumamo
   `(mumamo-background-chunk-major ((t (:background nil))))
   `(mumamo-background-chunk-submode1 ((t (:background ,void-blue))))
   `(mumamo-background-chunk-submode2 ((t (:background ,void-fg))))
   `(mumamo-background-chunk-submode3 ((t (:background ,void-blue))))
   `(mumamo-background-chunk-submode4 ((t (:background ,void-grey))))
;;;;; org-mode
   `(org-agenda-date-today
     ((t (:foreground ,void-yellow :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((t (:inherit font-lock-comment-face))))
   `(org-archived ((t (:foreground ,void-fg :weight bold))))
   `(org-checkbox ((t (:background ,void-fg :foreground ,void-yellow
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,void-cyan-1 :underline t))))
   `(org-deadline-announce ((t (:foreground ,void-red-pastel+3))))
   `(org-done ((t (:bold t :weight bold :foreground ,void-green))))
   `(org-formula ((t (:foreground ,void-yellow))))
   `(org-headline-done ((t (:foreground ,void-green))))
   `(org-hide ((t (:foreground ,void-blue))))
   `(org-level-1 ((t (:weight bold :foreground ,void-fg))))
   `(org-level-2 ((t (:foreground ,void-yellow))))
   `(org-level-3 ((t (:foreground ,void-blue))))
   `(org-level-4 ((t (:foreground ,void-yellow))))
   `(org-level-5 ((t (:foreground ,void-orange))))
   `(org-level-6 ((t (:foreground ,void-fg-1))))
   `(org-level-7 ((t (:foreground ,void-red-pastel))))
   `(org-level-8 ((t (:foreground ,void-yellow))))
   `(org-link ((t (:foreground ,void-yellow :underline t))))
   `(org-scheduled ((t (:foreground ,void-yellow))))
   `(org-scheduled-previously ((t (:foreground ,void-pink))))
   `(org-scheduled-today ((t (:foreground ,void-orange))))
   `(org-sexp-date ((t (:foreground ,void-orange :underline t))))
   `(org-special-keyword ((t (:inherit font-lock-comment-face))))
   `(org-table ((t (:foreground ,void-fg-1))))
   `(org-tag ((t (:bold t :weight bold))))
   `(org-time-grid ((t (:foreground ,void-fg))))
   `(org-todo ((t (:bold t :foreground ,void-pink :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:bold t :foreground ,void-pink :weight bold :underline nil))))
   `(org-column ((t (:background ,void-blue))))
   `(org-column-title ((t (:background ,void-blue :underline t :weight bold))))
   `(org-mode-line-clock ((t (:foreground ,void-fg :background ,void-blue))))
   `(org-mode-line-clock-overrun ((t (:foreground ,void-bg :background ,void-red-pastel+3))))
   `(org-ellipsis ((t (:foreground ,void-yellow+1 :underline t))))
   `(org-footnote ((t (:foreground ,void-orange :underline t))))
   `(org-document-title ((t (:foreground ,void-cyan-1))))
   `(org-document-info ((t (:foreground ,void-cyan-1))))
   `(org-habit-ready-face ((t :background ,void-fg-1)))
   `(org-habit-alert-face ((t :background ,void-yellow+1 :foreground ,void-bg)))
   `(org-habit-clear-face ((t :background ,void-cyan-3)))
   `(org-habit-overdue-face ((t :background ,void-red-pastel+1)))
   `(org-habit-clear-future-face ((t :background ,void-yellow)))
   `(org-habit-ready-future-face ((t :background ,void-fg-1)))
   `(org-habit-alert-future-face ((t :background ,void-yellow :foreground ,void-bg)))
   `(org-habit-overdue-future-face ((t :background ,void-red-pastel)))
;;;;; outline
   `(outline-1 ((t (:foreground ,void-fg))))
   `(outline-2 ((t (:foreground ,void-yellow))))
   `(outline-3 ((t (:foreground ,void-blue))))
   `(outline-4 ((t (:foreground ,void-yellow))))
   `(outline-5 ((t (:foreground ,void-orange))))
   `(outline-6 ((t (:foreground ,void-fg-1))))
   `(outline-7 ((t (:foreground ,void-red-pastel))))
   `(outline-8 ((t (:foreground ,void-yellow))))
;;;;; p4
   `(p4-depot-added-face ((t :inherit diff-added)))
   `(p4-depot-branch-op-face ((t :inherit diff-changed)))
   `(p4-depot-deleted-face ((t :inherit diff-removed)))
   `(p4-depot-unmapped-face ((t :inherit diff-changed)))
   `(p4-diff-change-face ((t :inherit diff-changed)))
   `(p4-diff-del-face ((t :inherit diff-removed)))
   `(p4-diff-file-face ((t :inherit diff-file-header)))
   `(p4-diff-head-face ((t :inherit diff-header)))
   `(p4-diff-ins-face ((t :inherit diff-added)))
;;;;; perspective
   `(persp-selected-face ((t (:foreground ,void-yellow :inherit mode-line))))
;;;;; powerline
   `(powerline-active1 ((t (:background ,void-bg+3 :inherit mode-line))))
   `(powerline-active2 ((t (:background ,void-fg :inherit mode-line))))
   `(powerline-inactive1 ((t (:background ,void-grey :inherit mode-line-inactive))))
   `(powerline-inactive2 ((t (:background ,void-blue :inherit mode-line-inactive))))
;;;;; proofgeneral
   `(proof-active-area-face ((t (:underline t))))
   `(proof-boring-face ((t (:foreground ,void-fg :background ,void-fg))))
   `(proof-command-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-debug-message-face ((t (:inherit proof-boring-face))))
   `(proof-declaration-name-face ((t (:inherit font-lock-keyword-face :foreground nil))))
   `(proof-eager-annotation-face ((t (:foreground ,void-bg :background ,void-fg))))
   `(proof-error-face ((t (:foreground ,void-fg :background ,void-red-pastel))))
   `(proof-highlight-dependency-face ((t (:foreground ,void-bg :background ,void-yellow+1))))
   `(proof-highlight-dependent-face ((t (:foreground ,void-bg :background ,void-fg))))
   `(proof-locked-face ((t (:background ,void-bg))))
   `(proof-mouse-highlight-face ((t (:foreground ,void-bg :background ,void-fg))))
   `(proof-queue-face ((t (:background ,void-red-pastel))))
   `(proof-region-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-script-highlight-error-face ((t (:background ,void-red-pastel+2))))
   `(proof-tacticals-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,void-bg))))
   `(proof-tactics-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,void-bg))))
   `(proof-warning-face ((t (:foreground ,void-bg :background ,void-yellow+1))))
;;;;; racket-mode
   `(racket-keyword-argument-face ((t (:inherit font-lock-constant-face))))
   `(racket-selfeval-face ((t (:inherit font-lock-type-face))))
;;;;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,void-fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,void-yellow))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,void-yellow))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,void-orange))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,void-fg-1))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,void-orange))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,void-yellow+1))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,void-bg))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,void-cyan-2))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,void-fg))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,void-fg-1))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,void-bg))))
;;;;; rcirc
   `(rcirc-my-nick ((t (:foreground ,void-cyan-1))))
   `(rcirc-other-nick ((t (:foreground ,void-fg))))
   `(rcirc-bright-nick ((t (:foreground ,void-orange))))
   `(rcirc-dim-nick ((t (:foreground ,void-cyan-2))))
   `(rcirc-server ((t (:foreground ,void-fg-1))))
   `(rcirc-server-prefix ((t (:foreground ,void-bg))))
   `(rcirc-timestamp ((t (:foreground ,void-fg-1))))
   `(rcirc-nick-in-message ((t (:foreground ,void-cyan))))
   `(rcirc-nick-in-message-full-line ((t (:bold t))))
   `(rcirc-prompt ((t (:foreground ,void-cyan :bold t))))
   `(rcirc-track-nick ((t (:inverse-video t))))
   `(rcirc-track-keyword ((t (:bold t))))
   `(rcirc-url ((t (:bold t))))
   `(rcirc-keyword ((t (:foreground ,void-cyan :bold t))))
;;;;; rpm-mode
   `(rpm-spec-dir-face ((t (:foreground ,void-fg-1))))
   `(rpm-spec-doc-face ((t (:foreground ,void-fg-1))))
   `(rpm-spec-ghost-face ((t (:foreground ,void-pink))))
   `(rpm-spec-macro-face ((t (:foreground ,void-cyan))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground ,void-pink))))
   `(rpm-spec-package-face ((t (:foreground ,void-pink))))
   `(rpm-spec-section-face ((t (:foreground ,void-cyan))))
   `(rpm-spec-tag-face ((t (:foreground ,void-cyan-1))))
   `(rpm-spec-var-face ((t (:foreground ,void-pink))))
;;;;; rst-mode
   `(rst-level-1-face ((t (:foreground ,void-fg))))
   `(rst-level-2-face ((t (:foreground ,void-bg))))
   `(rst-level-3-face ((t (:foreground ,void-blue))))
   `(rst-level-4-face ((t (:foreground ,void-yellow))))
   `(rst-level-5-face ((t (:foreground ,void-orange))))
   `(rst-level-6-face ((t (:foreground ,void-fg-1))))
;;;;; sh-mode
   `(sh-heredoc     ((t (:foreground ,void-cyan :bold t))))
   `(sh-quoted-exec ((t (:foreground ,void-pink))))
;;;;; show-paren
   `(show-paren-mismatch ((t (:foreground ,void-red-pastel+4 :background ,void-blue :weight bold))))
   `(show-paren-match ((t (:foreground ,void-cyan :background ,void-blue :weight bold))))
;;;;; smart-mode-line
   ;; use (setq sml/theme nil) to enable Zweilight for sml
   `(sml/global ((,class (:foreground ,void-fg :weight bold))))
   `(sml/modes ((,class (:foreground ,void-cyan :weight bold))))
   `(sml/minor-modes ((,class (:foreground ,void-grey+1 :weight bold))))
   `(sml/filename ((,class (:foreground ,void-cyan :weight bold))))
   `(sml/line-number ((,class (:foreground ,void-cyan-1 :weight bold))))
   `(sml/col-number ((,class (:foreground ,void-orange :weight bold))))
   `(sml/position-percentage ((,class (:foreground ,void-blue :weight bold))))
   `(sml/prefix ((,class (:foreground ,void-fg))))
   `(sml/git ((,class (:foreground ,void-green))))
   `(sml/process ((,class (:weight bold))))
   `(sml/sudo ((,class  (:foreground ,void-fg :weight bold))))
   `(sml/read-only ((,class (:foreground ,void-red-pastel+2))))
   `(sml/outside-modified ((,class (:foreground ,void-fg))))
   `(sml/modified ((,class (:foreground ,void-pink))))
   `(sml/vc-edited ((,class (:foreground ,void-fg-1))))
   `(sml/charging ((,class (:foreground ,void-yellow))))
   `(sml/discharging ((,class (:foreground ,void-red-pastel+4))))
;;;;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,void-red-pastel+4 :background ,void-blue :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,void-blue :weight bold))))
;;;;; sml-mode-line
   '(sml-modeline-end-face ((t :inherit default :width condensed)))
;;;;; SLIME
   `(slime-repl-output-face ((t (:foreground ,void-pink))))
   `(slime-repl-inputed-output-face ((t (:foreground ,void-fg-1))))
   `(slime-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-pink)))
      (t
       (:underline ,void-pink))))
   `(slime-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-fg)))
      (t
       (:underline ,void-fg))))
   `(slime-style-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-cyan)))
      (t
       (:underline ,void-cyan))))
   `(slime-note-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-fg-1)))
      (t
       (:underline ,void-fg-1))))
   `(slime-highlight-face ((t (:inherit highlight))))
;;;;; speedbar
   `(speedbar-button-face ((t (:foreground ,void-fg-1))))
   `(speedbar-directory-face ((t (:foreground ,void-orange))))
   `(speedbar-file-face ((t (:foreground ,void-fg))))
   `(speedbar-highlight-face ((t (:foreground ,void-bg :background ,void-fg-1))))
   `(speedbar-selected-face ((t (:foreground ,void-pink))))
   `(speedbar-separator-face ((t (:foreground ,void-bg :background ,void-blue))))
   `(speedbar-tag-face ((t (:foreground ,void-cyan))))
;;;;; tabbar
   `(tabbar-default ((t (:foreground ,void-fg
                        :background ,void-bg+3))))
   `(tabbar-button ((t (:foreground ,void-fg
                        :background ,void-bg+3))))
   `(tabbar-unselected ((t (:foreground ,void-fg
                            :background ,void-bg+3
                            ;; :box (:line-width -1 :style released-button)
                            ))))
   `(tabbar-selected ((t (:foreground ,void-bg+3
                           :background ,void-blue
                          ;; :box (:line-width -1 :style pressed-button)
                          ))))
   `(tabbar-modified ((t (:foreground ,void-red
                          :background ,void-bg+3))))
   `(tabbar-selected-modified ((t (:foreground ,void-bg+3
                                   :background ,void-red-1 ))))

;;;;; term
   `(term-color-black ((t (:foreground ,void-bg
                                       :background ,void-blue))))
   `(term-color-red ((t (:foreground ,void-red-pastel+2
                                     :background ,void-red-pastel))))
   `(term-color-green ((t (:foreground ,void-fg-1
                                       :background ,void-fg-1))))
   `(term-color-yellow ((t (:foreground ,void-fg
                                        :background ,void-cyan))))
   `(term-color-blue ((t (:foreground ,void-blue
                                      :background ,void-yellow))))
   `(term-color-magenta ((t (:foreground ,void-pink+1
                                         :background ,void-pink))))
   `(term-color-cyan ((t (:foreground ,void-orange
                                      :background ,void-cyan-1))))
   `(term-color-white ((t (:foreground ,void-fg
                                       :background ,void-grey+1))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))
;;;;; undo-tree
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,void-yellow :weight bold))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,void-red-pastel+3 :weight bold))))
   `(undo-tree-visualizer-default-face ((t (:foreground ,void-fg))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,void-cyan))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,void-orange))))
;;;;; volatile-highlights
   `(vhl/default-face ((t (:background ,void-bg+3))))
;;;;; web-mode
   `(web-mode-builtin-face ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face ((t (:foreground ,void-fg ))))
   `(web-mode-css-prop-face ((t (:foreground ,void-fg))))
   `(web-mode-css-pseudo-class-face ((t (:foreground ,void-green :weight bold))))
   `(web-mode-css-rule-face ((t (:foreground ,void-cyan-1))))
   `(web-mode-doctype-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face ((t (:underline t))))
   `(web-mode-function-name-face ((t (:foreground ,void-cyan-1))))
   `(web-mode-html-attr-name-face ((t (:foreground ,void-fg))))
   `(web-mode-html-attr-value-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face ((t (:foreground ,void-orange))))
   `(web-mode-keyword-face ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face ((t (:background ,void-bg))))
   `(web-mode-server-comment-face ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face ((t (:background ,void-pink))))
;;;;; whitespace-mode
   `(whitespace-space ((t (:background ,void-grey :foreground ,void-grey))))
   `(whitespace-hspace ((t (:background ,void-grey :foreground ,void-grey))))
   `(whitespace-tab ((t (:background ,void-bg+3))))
   `(whitespace-newline ((t (:foreground ,void-grey))))
   `(whitespace-trailing ((t (:background ,void-bg+3))))
   `(whitespace-line ((t (:background ,void-bg :foreground ,void-pink+1))))
   `(whitespace-space-before-tab ((t (:background ,void-fg :foreground ,void-fg))))
   `(whitespace-indentation ((t (:background ,void-bg :foreground ,void-fg-1))))
   `(whitespace-empty ((t (:background ,void-cyan))))
   `(whitespace-space-after-tab ((t (:background ,void-bg :foreground ,void-fg-1))))
;;;;; wanderlust
   `(wl-highlight-folder-few-face ((t (:foreground ,void-red-pastel+2))))
   `(wl-highlight-folder-many-face ((t (:foreground ,void-red-pastel+3))))
   `(wl-highlight-folder-path-face ((t (:foreground ,void-fg))))
   `(wl-highlight-folder-unread-face ((t (:foreground ,void-cyan-1))))
   `(wl-highlight-folder-zero-face ((t (:foreground ,void-fg))))
   `(wl-highlight-folder-unknown-face ((t (:foreground ,void-cyan-1))))
   `(wl-highlight-message-citation-header ((t (:foreground ,void-red-pastel+3))))
   `(wl-highlight-message-cited-text-1 ((t (:foreground ,void-pink))))
   `(wl-highlight-message-cited-text-2 ((t (:foreground ,void-fg-1))))
   `(wl-highlight-message-cited-text-3 ((t (:foreground ,void-cyan-1))))
   `(wl-highlight-message-cited-text-4 ((t (:foreground ,void-orange))))
   `(wl-highlight-message-header-contents-face ((t (:foreground ,void-fg-1))))
   `(wl-highlight-message-headers-face ((t (:foreground ,void-red-pastel+4))))
   `(wl-highlight-message-important-header-contents ((t (:foreground ,void-fg-1))))
   `(wl-highlight-message-header-contents ((t (:foreground ,void-bg))))
   `(wl-highlight-message-important-header-contents2 ((t (:foreground ,void-fg-1))))
   `(wl-highlight-message-signature ((t (:foreground ,void-fg-1))))
   `(wl-highlight-message-unimportant-header-contents ((t (:foreground ,void-fg))))
   `(wl-highlight-summary-answered-face ((t (:foreground ,void-cyan-1))))
   `(wl-highlight-summary-disposed-face ((t (:foreground ,void-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((t (:foreground ,void-cyan-1))))
   `(wl-highlight-summary-normal-face ((t (:foreground ,void-fg))))
   `(wl-highlight-summary-thread-top-face ((t (:foreground ,void-cyan))))
   `(wl-highlight-thread-indent-face ((t (:foreground ,void-pink+1))))
   `(wl-highlight-summary-refiled-face ((t (:foreground ,void-fg))))
   `(wl-highlight-summary-displaying-face ((t (:underline t :weight bold))))
;;;;; which-func-mode
   `(which-func ((t (:foreground ,void-yellow))))
;;;;; xcscope
   `(cscope-file-face ((t (:foreground ,void-cyan :weight bold))))
   `(cscope-function-face ((t (:foreground ,void-orange :weight bold))))
   `(cscope-line-number-face ((t (:foreground ,void-pink :weight bold))))
   `(cscope-mouse-face ((t (:foreground ,void-bg :background ,void-orange))))
   `(cscope-separator-face ((t (:foreground ,void-pink :weight bold
                                            :underline t :overline t))))
;;;;; yascroll
   `(yascroll:thumb-text-area ((t (:background ,void-blue))))
   `(yascroll:thumb-fringe ((t (:background ,void-blue :foreground ,void-blue))))

;;;;; highlight-indent-guides
   `(highlight-indent-guides-odd-face ((t (:background ,void-bg+1))))
   `(highlight-indent-guides-even-face ((t (:background ,void-bg+2))))
   ))

;;; Theme Variables
(zweilight-with-color-variables
  (custom-theme-set-variables
   'zweilight
;;;;; ansi-color
   `(ansi-color-names-vector [,void-bg ,void-pink ,void-fg-1 ,void-cyan
                                          ,void-cyan-1 ,void-pink+1 ,void-orange ,void-fg])
;;;;; fill-column-indicator
   `(fci-rule-color ,void-bg+3)
;;;;; nrepl-client
   `(nrepl-message-colors
     '(,void-pink ,void-fg ,void-cyan ,void-fg-1 ,void-yellow
                    ,void-orange ,void-orange ,void-pink+1))
;;;;; vc-annotate
   `(vc-annotate-color-map
     '(( 20. . ,void-red-pastel+3)
       ( 40. . ,void-pink)
       ( 60. . ,void-fg)
       ( 80. . ,void-yellow)
       (100. . ,void-yellow+1)
       (120. . ,void-cyan)
       (140. . ,void-fg-1)
       (160. . ,void-fg-1)
       (180. . ,void-bg)
       (200. . ,void-fg-1)
       (220. . ,void-green)
       (240. . ,void-yellow)
       (260. . ,void-orange)
       (280. . ,void-cyan-2)
       (300. . ,void-blue)
       (320. . ,void-cyan-1)
       (340. . ,void-orange)
       (360. . ,void-pink+1)))
   `(vc-annotate-very-old-color ,void-pink+1)
   `(vc-annotate-background ,void-blue)
   ))

;;; Rainbow Support

(declare-function rainbow-mode 'rainbow-mode)
(declare-function rainbow-colorize-by-assoc 'rainbow-mode)

(defvar zweilight-add-font-lock-keywords nil
  "Whether to add font-lock keywords for zweilight color names.
In buffers visiting library `zweilight-theme.el' the zweilight
specific keywords are always added.  In all other Emacs-Lisp
buffers this variable controls whether this should be done.
This requires library `rainbow-mode'.")

(defvar zweilight-colors-font-lock-keywords nil)

;; (defadvice rainbow-turn-on (after zweilight activate)
;;   "Maybe also add font-lock keywords for zweilight colors."
;;   (when (and (derived-mode-p 'emacs-lisp-mode)
;;              (or zweilight-add-font-lock-keywords
;;                  (equal (file-name-nondirectory (buffer-file-name))
;;                         "zweilight-theme.el")))
;;     (unless zweilight-colors-font-lock-keywords
;;       (setq zweilight-colors-font-lock-keywords
;;             `((,(regexp-opt (mapcar 'car zweilight-colors-alist) 'words)
;;                (0 (rainbow-colorize-by-assoc zweilight-colors-alist))))))
;;     (font-lock-add-keywords nil zweilight-colors-font-lock-keywords)))

;; (defadvice rainbow-turn-off (after zweilight activate)
;;   "Also remove font-lock keywords for zweilight colors."
;;   (font-lock-remove-keywords nil zweilight-colors-font-lock-keywords))

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'zweilight)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:
;;; zweilight-theme.el ends here
