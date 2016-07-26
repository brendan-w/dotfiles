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
    ("void-cyan"          . "#0bafed")
    ("void-pink"          . "#ee11dd")
    ("void-pink+1"        . "#DC8CC3")
    ("zweilight-fg"       . "#8584ae")
    ("zweilight-fg-1"     . "#656555")
    ("zweilight-bg-05"    . "#252634")
    ("zweilight-bg"        . "#1b1a24")
    ("void-bg"             . "#1b1a24")
    ("void-bg+1"          . "#4c406d")
    ("zweilight-bg+05"    . "#494949")
    ("zweilight-bg+1"     . "#4F4F4F")
    ("zweilight-bg+2"     . "#8584ae")
    ("zweilight-bg+3"     . "#0bafed")
    ("void-red-pastel+4"    . "#DCA3A3")
    ("void-red-pastel+3"    . "#BC8383")
    ("void-red-pastel+2"    . "#AC7373")
    ("void-red-pastel+1"    . "#9C6363")
    ("void-red-pastel"      . "#8C5353")
    ("zweilight-orange"   . "#8584ae")
    ("zweilight-yellow"   . "#b4f5fe")
    ("zweilight-bg-2"     . "#1b1a24")
    ("void-green"  . "#65ba08")
    ("void-blue-pastel+2" . "#8CD0D3")
    ("void-blue-pastel+1" . "#6CA0A3")
    ("void-blue-pastel"   . "#5C888B")
    ("zweilight-1"        . "#1f1d2e")
    ("zweilight-2"        . "#211f30"))
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
   `(link ((t (:foreground ,zweilight-yellow :underline t :weight bold))))
   `(link-visited ((t (:foreground ,void-yellow :underline t :weight normal))))
   `(default ((t (:foreground ,zweilight-fg :background ,zweilight-bg))))
   `(cursor ((t (:foreground ,zweilight-fg :background ,void-yellow))))
   `(escape-glyph ((t (:foreground ,zweilight-yellow :bold t))))
   `(fringe ((t (:foreground ,zweilight-fg :background ,zweilight-bg))))
   `(header-line ((t (:foreground ,zweilight-yellow
                                  :background ,void-cyan
                                  :box (:line-width -1 :style released-button)))))
   `(highlight ((t (:background ,zweilight-bg-05))))
   `(success ((t (:foreground ,void-bg+1 :weight bold))))
   `(warning ((t (:foreground ,zweilight-orange :weight bold))))
   `(tooltip ((t (:foreground ,zweilight-fg :background ,zweilight-bg+1))))
;;;;; compilation
   `(compilation-column-face ((t (:foreground ,zweilight-yellow))))
   `(compilation-enter-directory-face ((t (:foreground ,void-bg+1))))
   `(compilation-error-face ((t (:foreground ,void-red-pastel+3 :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,zweilight-fg))))
   `(compilation-info-face ((t (:foreground ,void-blue-pastel+2))))
   `(compilation-info ((t (:foreground ,void-yellow :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,void-bg+1))))
   `(compilation-line-face ((t (:foreground ,zweilight-yellow))))
   `(compilation-line-number ((t (:foreground ,zweilight-yellow))))
   `(compilation-message-face ((t (:foreground ,void-blue-pastel+2))))
   `(compilation-warning-face ((t (:foreground ,zweilight-orange :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,void-bg+1 :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,void-pink :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,zweilight-yellow :weight bold))))
;;;;; completions
   `(completions-annotations ((t (:foreground ,zweilight-fg-1))))
;;;;; grep
   `(grep-context-face ((t (:foreground ,zweilight-fg))))
   `(grep-error-face ((t (:foreground ,void-red-pastel+3 :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,void-blue-pastel+2))))
   `(grep-match-face ((t (:foreground ,zweilight-orange :weight bold))))
   `(match ((t (:background ,void-cyan :foreground ,zweilight-orange :weight bold))))
;;;;; isearch
   `(isearch ((t (:foreground ,void-yellow :weight bold :background ,zweilight-bg+2))))
   `(isearch-fail ((t (:foreground ,zweilight-fg :background ,void-red-pastel))))
   `(lazy-highlight ((t (:foreground ,void-yellow :weight bold :background ,zweilight-bg-05))))

   `(menu ((t (:foreground ,zweilight-fg :background ,zweilight-bg))))
   `(minibuffer-prompt ((t (:foreground ,zweilight-yellow))))
   `(mode-line
     ((,class (:foreground ,zweilight-fg
               :background ,void-bg+1))
      (t :inverse-video t)))
   `(mode-line-buffer-id ((t (:foreground ,zweilight-yellow :weight bold))))
   `(mode-line-inactive
     ((t (:foreground ,void-bg+1
          :background ,zweilight-bg-05))))
   `(region ((,class (:background ,zweilight-bg-05))
             (t :inverse-video t)))
   `(secondary-selection ((t (:background ,zweilight-bg+2))))
   `(trailing-whitespace ((t (:background ,void-pink))))
   `(vertical-border ((t (:foreground ,zweilight-fg))))
;;;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,zweilight-yellow))))
   `(font-lock-comment-face ((t (:foreground ,void-bg+1 :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,void-bg+1))))
   `(font-lock-constant-face ((t (:foreground ,void-yellow))))
   `(font-lock-doc-face ((t (:foreground ,void-bg+1 :slant italic))))
   `(font-lock-function-name-face ((t (:foreground ,void-orange))))
   `(font-lock-keyword-face ((t (:foreground ,zweilight-yellow ))))
   `(font-lock-negation-char-face ((t (:foreground ,zweilight-yellow))))
   `(font-lock-preprocessor-face ((t (:foreground ,void-orange))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,zweilight-yellow :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,void-bg+1 :weight bold))))
   `(font-lock-string-face ((t (:foreground ,void-pink))))
   `(font-lock-type-face ((t (:foreground ,void-cyan))))
   `(font-lock-variable-name-face ((t (:foreground ,zweilight-orange))))
   `(font-lock-warning-face ((t (:foreground ,void-yellow :weight bold))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))
;;;;; newsticker
   `(newsticker-date-face ((t (:foreground ,zweilight-fg))))
   `(newsticker-default-face ((t (:foreground ,zweilight-fg))))
   `(newsticker-enclosure-face ((t (:foreground ,void-green))))
   `(newsticker-extra-face ((t (:foreground ,zweilight-bg+2 :height 0.8))))
   `(newsticker-feed-face ((t (:foreground ,zweilight-fg))))
   `(newsticker-immortal-item-face ((t (:foreground ,void-bg+1))))
   `(newsticker-new-item-face ((t (:foreground ,void-blue-pastel+2))))
   `(newsticker-obsolete-item-face ((t (:foreground ,void-pink))))
   `(newsticker-old-item-face ((t (:foreground ,zweilight-bg+3))))
   `(newsticker-statistics-face ((t (:foreground ,zweilight-fg))))
   `(newsticker-treeview-face ((t (:foreground ,zweilight-fg))))
   `(newsticker-treeview-immortal-face ((t (:foreground ,void-bg+1))))
   `(newsticker-treeview-listwindow-face ((t (:foreground ,zweilight-fg))))
   `(newsticker-treeview-new-face ((t (:foreground ,void-blue-pastel+2 :weight bold))))
   `(newsticker-treeview-obsolete-face ((t (:foreground ,void-pink))))
   `(newsticker-treeview-old-face ((t (:foreground ,zweilight-bg+3))))
   `(newsticker-treeview-selection-face ((t (:background ,void-cyan :foreground ,zweilight-yellow))))
;;;; Third-party
;;;;; ace-jump
   `(ace-jump-face-background
     ((t (:foreground ,zweilight-fg-1 :background ,zweilight-bg :inverse-video nil))))
   `(ace-jump-face-foreground
     ((t (:foreground ,void-bg+1 :background ,zweilight-bg :inverse-video nil))))
;;;;; ace-window
   `(aw-background-face
     ((t (:foreground ,zweilight-fg-1 :background ,zweilight-bg :inverse-video nil))))
   `(aw-leading-char-face ((t (:inherit aw-mode-line-face))))
;;;;; android mode
   `(android-mode-debug-face ((t (:foreground ,void-bg))))
   `(android-mode-error-face ((t (:foreground ,zweilight-orange :weight bold))))
   `(android-mode-info-face ((t (:foreground ,zweilight-fg))))
   `(android-mode-verbose-face ((t (:foreground ,void-bg+1))))
   `(android-mode-warning-face ((t (:foreground ,zweilight-yellow))))
;;;;; anzu
   `(anzu-mode-line ((t (:foreground ,void-orange :weight bold))))
   `(anzu-match-1 ((t (:foreground ,zweilight-bg :background ,void-bg+1))))
   `(anzu-match-2 ((t (:foreground ,zweilight-bg :background ,zweilight-orange))))
   `(anzu-match-3 ((t (:foreground ,zweilight-bg :background ,void-blue-pastel+2))))
   `(anzu-replace-to ((t (:inherit anzu-replace-highlight :foreground ,zweilight-yellow))))
;;;;; auctex
   `(font-latex-bold-face ((t (:inherit bold))))
   `(font-latex-warning-face ((t (:foreground nil :inherit font-lock-warning-face))))
   `(font-latex-sectioning-5-face ((t (:foreground ,void-pink :weight bold ))))
   `(font-latex-sedate-face ((t (:foreground ,zweilight-yellow))))
   `(font-latex-italic-face ((t (:foreground ,void-orange :slant italic))))
   `(font-latex-string-face ((t (:inherit ,font-lock-string-face))))
   `(font-latex-math-face ((t (:foreground ,zweilight-orange))))
;;;;; agda-mode
   `(agda2-highlight-keyword-face ((t (:foreground ,zweilight-yellow :weight bold))))
   `(agda2-highlight-string-face ((t (:foreground ,void-pink))))
   `(agda2-highlight-symbol-face ((t (:foreground ,zweilight-orange))))
   `(agda2-highlight-primitive-type-face ((t (:foreground ,void-cyan))))
   `(agda2-highlight-inductive-constructor-face ((t (:foreground ,zweilight-fg))))
   `(agda2-highlight-coinductive-constructor-face ((t (:foreground ,zweilight-fg))))
   `(agda2-highlight-datatype-face ((t (:foreground ,void-blue-pastel+2))))
   `(agda2-highlight-function-face ((t (:foreground ,void-blue-pastel+2))))
   `(agda2-highlight-module-face ((t (:foreground ,void-cyan))))
   `(agda2-highlight-error-face ((t (:foreground ,zweilight-bg :background ,void-pink+1))))
   `(agda2-highlight-unsolved-meta-face ((t (:foreground ,zweilight-bg :background ,void-pink+1))))
   `(agda2-highlight-unsolved-constraint-face ((t (:foreground ,zweilight-bg :background ,void-pink+1))))
   `(agda2-highlight-termination-problem-face ((t (:foreground ,zweilight-bg :background ,void-pink+1))))
   `(agda2-highlight-incomplete-pattern-face ((t (:foreground ,zweilight-bg :background ,void-pink+1))))
   `(agda2-highlight-typechecks-face ((t (:background ,void-red-pastel))))
;;;;; auto-complete
   `(ac-candidate-face ((t (:background ,zweilight-bg+3 :foreground ,zweilight-bg-2))))
   `(ac-selection-face ((t (:background ,void-yellow :foreground ,zweilight-bg-2))))
   `(popup-tip-face ((t (:background ,void-yellow :foreground ,zweilight-bg-2))))
   `(popup-scroll-bar-foreground-face ((t (:background ,void-bg))))
   `(popup-scroll-bar-background-face ((t (:background ,zweilight-bg-05))))
   `(popup-isearch-match ((t (:background ,zweilight-bg :foreground ,zweilight-fg))))
;;;;; avy
   `(avy-background-face
     ((t (:foreground ,zweilight-fg-1 :background ,zweilight-bg :inverse-video nil))))
   `(avy-lead-face-0
     ((t (:foreground ,void-green :background ,zweilight-bg :inverse-video nil :weight bold))))
   `(avy-lead-face-1
     ((t (:foreground ,zweilight-yellow :background ,zweilight-bg :inverse-video nil :weight bold))))
   `(avy-lead-face-2
     ((t (:foreground ,void-red-pastel+4 :background ,zweilight-bg :inverse-video nil :weight bold))))
   `(avy-lead-face
     ((t (:foreground ,void-orange :background ,zweilight-bg :inverse-video nil :weight bold))))
;;;;; company-mode
   `(company-tooltip ((t (:foreground ,zweilight-fg :background ,zweilight-bg+1))))
   `(company-tooltip-annotation ((t (:foreground ,zweilight-orange :background ,zweilight-bg+1))))
   `(company-tooltip-annotation-selection ((t (:foreground ,zweilight-orange :background ,void-cyan))))
   `(company-tooltip-selection ((t (:foreground ,zweilight-fg :background ,void-cyan))))
   `(company-tooltip-mouse ((t (:background ,void-cyan))))
   `(company-tooltip-common ((t (:foreground ,void-bg+1))))
   `(company-tooltip-common-selection ((t (:foreground ,void-bg+1))))
   `(company-scrollbar-fg ((t (:background ,void-cyan))))
   `(company-scrollbar-bg ((t (:background ,zweilight-bg+2))))
   `(company-preview ((t (:background ,void-bg+1))))
   `(company-preview-common ((t (:foreground ,void-bg+1 :background ,void-cyan))))
;;;;; bm
   `(bm-face ((t (:background ,void-yellow+1 :foreground ,zweilight-bg))))
   `(bm-fringe-face ((t (:background ,void-yellow+1 :foreground ,zweilight-bg))))
   `(bm-fringe-persistent-face ((t (:background ,void-bg+1 :foreground ,zweilight-bg))))
   `(bm-persistent-face ((t (:background ,void-bg+1 :foreground ,zweilight-bg))))
;;;;; cider
   `(cider-result-overlay-face ((t (:foreground ,zweilight-fg-1 :background unspecified))))
   `(cider-enlightened-face ((t (:box (:color ,zweilight-orange :line-width -1)))))
   `(cider-enlightened-local-face ((t (:weight bold :foreground ,void-bg))))
   `(cider-deprecated-face ((t (:background ,void-yellow))))
   `(cider-instrumented-face ((t (:box (:color ,void-pink :line-width -1)))))
   `(cider-traced-face ((t (:box (:color ,void-orange :line-width -1)))))
   `(cider-test-failure-face ((t (:background ,void-red-pastel))))
   `(cider-test-error-face ((t (:background ,void-pink+1))))
   `(cider-test-success-face ((t (:background ,void-bg+1))))
;;;;; circe
   `(circe-highlight-nick-face ((t (:foreground ,void-orange))))
   `(circe-my-message-face ((t (:foreground ,zweilight-fg))))
   `(circe-fool-face ((t (:foreground ,void-red-pastel+4))))
   `(circe-topic-diff-removed-face ((t (:foreground ,void-pink :weight bold))))
   `(circe-originator-face ((t (:foreground ,zweilight-fg))))
   `(circe-server-face ((t (:foreground ,void-bg+1))))
   `(circe-topic-diff-new-face ((t (:foreground ,zweilight-orange :weight bold))))
   `(circe-prompt-face ((t (:foreground ,zweilight-orange :background ,zweilight-bg :weight bold))))
;;;;; context-coloring
   `(context-coloring-level-0-face ((t :foreground ,zweilight-fg)))
   `(context-coloring-level-1-face ((t :foreground ,void-orange)))
   `(context-coloring-level-2-face ((t :foreground ,void-yellow)))
   `(context-coloring-level-3-face ((t :foreground ,zweilight-yellow)))
   `(context-coloring-level-4-face ((t :foreground ,zweilight-orange)))
   `(context-coloring-level-5-face ((t :foreground ,void-pink+1)))
   `(context-coloring-level-6-face ((t :foreground ,void-orange)))
   `(context-coloring-level-7-face ((t :foreground ,void-bg+1)))
   `(context-coloring-level-8-face ((t :foreground ,void-yellow)))
   `(context-coloring-level-9-face ((t :foreground ,void-red-pastel+4)))
;;;;; coq
   `(coq-solve-tactics-face ((t (:foreground nil :inherit font-lock-constant-face))))
;;;;; ctable
   `(ctbl:face-cell-select ((t (:background ,void-blue-pastel+2 :foreground ,zweilight-bg))))
   `(ctbl:face-continue-bar ((t (:background ,zweilight-bg-05 :foreground ,zweilight-bg))))
   `(ctbl:face-row-select ((t (:background ,void-orange :foreground ,zweilight-bg))))
;;;;; diff
   `(diff-added          ((t (:background "#335533" :foreground ,void-bg+1))))
   `(diff-changed        ((t (:background "#555511" :foreground ,void-yellow+1))))
   `(diff-removed        ((t (:background "#553333" :foreground ,void-red-pastel+2))))
   `(diff-refine-added   ((t (:background "#338833" :foreground ,void-yellow))))
   `(diff-refine-change  ((t (:background "#888811" :foreground ,zweilight-yellow))))
   `(diff-refine-removed ((t (:background "#883333" :foreground ,void-pink))))
   `(diff-header ((,class (:background ,zweilight-bg+2))
                  (t (:background ,zweilight-fg :foreground ,zweilight-bg))))
   `(diff-file-header
     ((,class (:background ,zweilight-bg+2 :foreground ,zweilight-fg :bold t))
      (t (:background ,zweilight-fg :foreground ,zweilight-bg :bold t))))
;;;;; diff-hl
   `(diff-hl-change ((,class (:foreground ,void-blue-pastel+2 :background ,void-blue-pastel+1))))
   `(diff-hl-delete ((,class (:foreground ,void-red-pastel+4 :background ,void-red-pastel+3))))
   `(diff-hl-insert ((,class (:foreground ,void-bg :background ,void-bg+1))))
;;;;; dim-autoload
   `(dim-autoload-cookie-line ((t :foreground ,zweilight-bg+1)))
;;;;; dired+
   `(diredp-display-msg ((t (:foreground ,void-blue-pastel+2))))
   `(diredp-compressed-file-suffix ((t (:foreground ,zweilight-orange))))
   `(diredp-date-time ((t (:foreground ,void-pink+1))))
   `(diredp-deletion ((t (:foreground ,zweilight-yellow))))
   `(diredp-deletion-file-name ((t (:foreground ,void-pink))))
   `(diredp-dir-heading ((t (:foreground ,void-blue-pastel+2 :background ,void-cyan))))
   `(diredp-dir-priv ((t (:foreground ,void-orange))))
   `(diredp-exec-priv ((t (:foreground ,void-pink))))
   `(diredp-executable-tag ((t (:foreground ,void-bg))))
   `(diredp-file-name ((t (:foreground ,void-blue-pastel+2))))
   `(diredp-file-suffix ((t (:foreground ,void-bg+1))))
   `(diredp-flag-mark ((t (:foreground ,zweilight-yellow))))
   `(diredp-flag-mark-line ((t (:foreground ,zweilight-orange))))
   `(diredp-ignored-file-name ((t (:foreground ,void-pink))))
   `(diredp-link-priv ((t (:foreground ,zweilight-yellow))))
   `(diredp-mode-line-flagged ((t (:foreground ,zweilight-yellow))))
   `(diredp-mode-line-marked ((t (:foreground ,zweilight-orange))))
   `(diredp-no-priv ((t (:foreground ,zweilight-fg))))
   `(diredp-number ((t (:foreground ,void-bg))))
   `(diredp-other-priv ((t (:foreground ,void-yellow+1))))
   `(diredp-rare-priv ((t (:foreground ,void-red-pastel+3))))
   `(diredp-read-priv ((t (:foreground ,void-bg+1))))
   `(diredp-symlink ((t (:foreground ,zweilight-yellow))))
   `(diredp-write-priv ((t (:foreground ,void-pink+1))))
;;;;; dired-async
   `(dired-async-failures ((t (:foreground ,void-pink :weight bold))))
   `(dired-async-message ((t (:foreground ,zweilight-yellow :weight bold))))
   `(dired-async-mode-message ((t (:foreground ,zweilight-yellow))))
;;;;; ediff
   `(ediff-current-diff-A ((t (:foreground ,zweilight-fg :background ,void-red-pastel))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,zweilight-fg :background ,void-red-pastel))))
   `(ediff-current-diff-B ((t (:foreground ,zweilight-fg :background ,void-bg+1))))
   `(ediff-current-diff-C ((t (:foreground ,zweilight-fg :background ,void-bg))))
   `(ediff-even-diff-A ((t (:background ,zweilight-bg+1))))
   `(ediff-even-diff-Ancestor ((t (:background ,zweilight-bg+1))))
   `(ediff-even-diff-B ((t (:background ,zweilight-bg+1))))
   `(ediff-even-diff-C ((t (:background ,zweilight-bg+1))))
   `(ediff-fine-diff-A ((t (:foreground ,zweilight-fg :background ,void-red-pastel+2 :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,zweilight-fg :background ,void-red-pastel+2 weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,zweilight-fg :background ,void-bg+1 :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,zweilight-fg :background ,void-blue-pastel :weight bold ))))
   `(ediff-odd-diff-A ((t (:background ,zweilight-bg+2))))
   `(ediff-odd-diff-Ancestor ((t (:background ,zweilight-bg+2))))
   `(ediff-odd-diff-B ((t (:background ,zweilight-bg+2))))
   `(ediff-odd-diff-C ((t (:background ,zweilight-bg+2))))
;;;;; egg
   `(egg-text-base ((t (:foreground ,zweilight-fg))))
   `(egg-help-header-1 ((t (:foreground ,zweilight-yellow))))
   `(egg-help-header-2 ((t (:foreground ,void-green))))
   `(egg-branch ((t (:foreground ,zweilight-yellow))))
   `(egg-branch-mono ((t (:foreground ,zweilight-yellow))))
   `(egg-term ((t (:foreground ,zweilight-yellow))))
   `(egg-diff-add ((t (:foreground ,void-yellow))))
   `(egg-diff-del ((t (:foreground ,void-red-pastel+4))))
   `(egg-diff-file-header ((t (:foreground ,void-yellow))))
   `(egg-section-title ((t (:foreground ,zweilight-yellow))))
   `(egg-stash-mono ((t (:foreground ,void-yellow))))
;;;;; elfeed
   `(elfeed-log-error-level-face ((t (:foreground ,void-pink))))
   `(elfeed-log-info-level-face ((t (:foreground ,void-blue-pastel+2))))
   `(elfeed-log-warn-level-face ((t (:foreground ,zweilight-yellow))))
   `(elfeed-search-date-face ((t (:foreground ,void-yellow+1 :underline t
                                              :weight bold))))
   `(elfeed-search-tag-face ((t (:foreground ,void-bg+1))))
   `(elfeed-search-feed-face ((t (:foreground ,void-orange))))
;;;;; emacs-w3m
   `(w3m-anchor ((t (:foreground ,zweilight-yellow :underline t
                                 :weight bold))))
   `(w3m-arrived-anchor ((t (:foreground ,void-yellow
                                         :underline t :weight normal))))
   `(w3m-form ((t (:foreground ,void-red-pastel+3 :underline t))))
   `(w3m-header-line-location-title ((t (:foreground ,zweilight-yellow
                                                     :underline t :weight bold))))
   '(w3m-history-current-url ((t (:inherit match))))
   `(w3m-lnum ((t (:foreground ,void-bg+1 :background ,zweilight-bg))))
   `(w3m-lnum-match ((t (:background ,void-cyan
                                     :foreground ,zweilight-orange
                                     :weight bold))))
   `(w3m-lnum-minibuffer-prompt ((t (:foreground ,zweilight-yellow))))
;;;;; erc
   `(erc-action-face ((t (:inherit erc-default-face))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,void-blue-pastel+2 :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
   `(erc-default-face ((t (:foreground ,zweilight-fg))))
   `(erc-direct-msg-face ((t (:inherit erc-default-face))))
   `(erc-error-face ((t (:inherit font-lock-warning-face))))
   `(erc-fool-face ((t (:inherit erc-default-face))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,zweilight-yellow))))
   `(erc-keyword-face ((t (:foreground ,void-blue-pastel+2 :weight bold))))
   `(erc-nick-default-face ((t (:foreground ,zweilight-yellow :weight bold))))
   `(erc-my-nick-face ((t (:foreground ,void-pink :weight bold))))
   `(erc-nick-msg-face ((t (:inherit erc-default-face))))
   `(erc-notice-face ((t (:foreground ,void-bg+1))))
   `(erc-pal-face ((t (:foreground ,zweilight-orange :weight bold))))
   `(erc-prompt-face ((t (:foreground ,zweilight-orange :background ,zweilight-bg :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,void-yellow))))
   `(erc-underline-face ((t (:underline t))))
;;;;; ert
   `(ert-test-result-expected ((t (:foreground ,void-yellow :background ,zweilight-bg))))
   `(ert-test-result-unexpected ((t (:foreground ,void-pink :background ,zweilight-bg))))
;;;;; eshell
   `(eshell-prompt ((t (:foreground ,zweilight-yellow :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,void-red-pastel+3 :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,void-orange :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,void-red-pastel+4 :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,zweilight-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,zweilight-yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,void-orange :weight bold))))
;;;;; flx
   `(flx-highlight-face ((t (:foreground ,void-bg+1 :weight bold))))
;;;;; flycheck
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-red-pastel+3) :inherit unspecified))
      (t (:foreground ,void-red-pastel+3 :weight bold :underline t))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zweilight-yellow) :inherit unspecified))
      (t (:foreground ,zweilight-yellow :weight bold :underline t))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-orange) :inherit unspecified))
      (t (:foreground ,void-orange :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,void-red-pastel+3 :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,zweilight-yellow :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,void-orange :weight bold))))
;;;;; flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-pink)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,void-red-pastel+3 :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zweilight-orange)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,zweilight-orange :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-bg+1)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,void-bg+1 :weight bold :underline t))))
;;;;; flyspell
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zweilight-orange) :inherit unspecified))
      (t (:foreground ,zweilight-orange :weight bold :underline t))))
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-pink) :inherit unspecified))
      (t (:foreground ,void-red-pastel+3 :weight bold :underline t))))
;;;;; full-ack
   `(ack-separator ((t (:foreground ,zweilight-fg))))
   `(ack-file ((t (:foreground ,void-blue-pastel+2))))
   `(ack-line ((t (:foreground ,zweilight-yellow))))
   `(ack-match ((t (:foreground ,zweilight-orange :background ,void-cyan :weight bold))))
;;;;; git-commit
   `(git-commit-comment-action  ((,class (:foreground ,void-bg :weight bold))))
   `(git-commit-comment-branch  ((,class (:foreground ,void-orange  :weight bold))))
   `(git-commit-comment-heading ((,class (:foreground ,zweilight-yellow  :weight bold))))
;;;;; git-gutter
   `(git-gutter:added ((t (:foreground ,void-bg+1 :weight bold :inverse-video t))))
   `(git-gutter:deleted ((t (:foreground ,void-pink :weight bold :inverse-video t))))
   `(git-gutter:modified ((t (:foreground ,void-pink+1 :weight bold :inverse-video t))))
   `(git-gutter:unchanged ((t (:foreground ,zweilight-fg :weight bold :inverse-video t))))
;;;;; git-gutter-fr
   `(git-gutter-fr:added ((t (:foreground ,void-bg+1  :weight bold))))
   `(git-gutter-fr:deleted ((t (:foreground ,void-pink :weight bold))))
   `(git-gutter-fr:modified ((t (:foreground ,void-pink+1 :weight bold))))
;;;;; git-rebase
   `(git-rebase-hash ((t (:foreground, zweilight-orange))))
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
   `(gnus-server-opened ((t (:foreground ,void-bg+1 :weight bold))))
   `(gnus-server-denied ((t (:foreground ,void-red-pastel+4 :weight bold))))
   `(gnus-server-closed ((t (:foreground ,void-blue-pastel+2 :slant italic))))
   `(gnus-server-offline ((t (:foreground ,zweilight-yellow :weight bold))))
   `(gnus-server-agent ((t (:foreground ,void-blue-pastel+2 :weight bold))))
   `(gnus-summary-cancelled ((t (:foreground ,zweilight-orange))))
   `(gnus-summary-high-ancient ((t (:foreground ,void-blue-pastel+2))))
   `(gnus-summary-high-read ((t (:foreground ,void-bg+1 :weight bold))))
   `(gnus-summary-high-ticked ((t (:foreground ,zweilight-orange :weight bold))))
   `(gnus-summary-high-unread ((t (:foreground ,zweilight-fg :weight bold))))
   `(gnus-summary-low-ancient ((t (:foreground ,void-blue-pastel+2))))
   `(gnus-summary-low-read ((t (:foreground ,void-bg+1))))
   `(gnus-summary-low-ticked ((t (:foreground ,zweilight-orange :weight bold))))
   `(gnus-summary-low-unread ((t (:foreground ,zweilight-fg))))
   `(gnus-summary-normal-ancient ((t (:foreground ,void-blue-pastel+2))))
   `(gnus-summary-normal-read ((t (:foreground ,void-bg+1))))
   `(gnus-summary-normal-ticked ((t (:foreground ,zweilight-orange :weight bold))))
   `(gnus-summary-normal-unread ((t (:foreground ,zweilight-fg))))
   `(gnus-summary-selected ((t (:foreground ,zweilight-yellow :weight bold))))
   `(gnus-cite-1 ((t (:foreground ,void-blue-pastel+2))))
   `(gnus-cite-10 ((t (:foreground ,void-yellow+1))))
   `(gnus-cite-11 ((t (:foreground ,zweilight-yellow))))
   `(gnus-cite-2 ((t (:foreground ,void-cyan))))
   `(gnus-cite-3 ((t (:foreground ,void-blue-pastel+1))))
   `(gnus-cite-4 ((t (:foreground ,void-bg+1))))
   `(gnus-cite-5 ((t (:foreground ,void-bg))))
   `(gnus-cite-6 ((t (:foreground ,void-bg+1))))
   `(gnus-cite-7 ((t (:foreground ,void-pink))))
   `(gnus-cite-8 ((t (:foreground ,void-red-pastel+3))))
   `(gnus-cite-9 ((t (:foreground ,void-red-pastel+2))))
   `(gnus-group-news-1-empty ((t (:foreground ,zweilight-yellow))))
   `(gnus-group-news-2-empty ((t (:foreground ,void-green))))
   `(gnus-group-news-3-empty ((t (:foreground ,void-bg))))
   `(gnus-group-news-4-empty ((t (:foreground ,void-blue-pastel+1))))
   `(gnus-group-news-5-empty ((t (:foreground ,void-blue-pastel))))
   `(gnus-group-news-6-empty ((t (:foreground ,zweilight-bg+2))))
   `(gnus-group-news-low-empty ((t (:foreground ,zweilight-bg+2))))
   `(gnus-signature ((t (:foreground ,zweilight-yellow))))
   `(gnus-x ((t (:background ,zweilight-fg :foreground ,zweilight-bg))))
;;;;; guide-key
   `(guide-key/highlight-command-face ((t (:foreground ,void-blue-pastel+2))))
   `(guide-key/key-face ((t (:foreground ,void-bg+1))))
   `(guide-key/prefix-command-face ((t (:foreground ,void-bg))))
;;;;; helm
   `(helm-header
     ((t (:foreground ,void-bg+1
          :background ,zweilight-bg
          :underline nil
          :box nil))))
   `(helm-source-header
     ((t (:foreground ,zweilight-yellow
          ;; :background ,void-cyan
          :underline nil
          :weight bold
          ;; :box (:line-width -1 :style released-button)
          :box nil))))
   `(helm-selection ((t (:background ,zweilight-bg-05 :underline nil))))
   ;; `(helm-selection ((t (:background ,void-bg+1 :underline nil))))
   `(helm-selection-line ((t (:background ,zweilight-bg+1))))
   `(helm-visible-mark ((t (:foreground ,zweilight-bg :background ,void-yellow))))
   ;; `(helm-candidate-number ((t (:foreground ,void-yellow :background ,void-cyan))))
   `(helm-candidate-number ((t (:foreground nil :background nil))))
   `(helm-separator ((t (:foreground ,void-pink :background ,zweilight-bg))))
   `(helm-time-zone-current ((t (:foreground ,void-bg+1 :background ,zweilight-bg))))
   `(helm-time-zone-home ((t (:foreground ,void-pink :background ,zweilight-bg))))
   `(helm-bookmark-addressbook ((t (:foreground ,zweilight-orange :background ,zweilight-bg))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,void-pink+1 :background ,zweilight-bg))))
   `(helm-bookmark-info ((t (:foreground ,void-bg+1 :background ,zweilight-bg))))
   `(helm-bookmark-man ((t (:foreground ,zweilight-yellow :background ,zweilight-bg))))
   `(helm-bookmark-w3m ((t (:foreground ,void-pink+1 :background ,zweilight-bg))))
   `(helm-buffer-not-saved ((t (:foreground ,void-pink :background ,zweilight-bg))))
   `(helm-buffer-process ((t (:foreground ,void-orange :background ,zweilight-bg))))
   `(helm-buffer-saved-out ((t (:foreground ,zweilight-fg :background ,zweilight-bg))))
   `(helm-buffer-size ((t (:foreground ,zweilight-fg-1 :background ,zweilight-bg))))
   `(helm-ff-directory ((t (:foreground ,void-orange :background ,zweilight-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,zweilight-fg :background ,zweilight-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,void-bg+1 :background ,zweilight-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,void-pink :background ,zweilight-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,zweilight-yellow :background ,zweilight-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,zweilight-bg :background ,zweilight-yellow :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,void-orange :background ,zweilight-bg))))
   `(helm-grep-file ((t (:foreground ,zweilight-fg :background ,zweilight-bg))))
   `(helm-grep-finish ((t (:foreground ,void-bg+1 :background ,zweilight-bg))))
   `(helm-grep-lineno ((t (:foreground ,zweilight-fg-1 :background ,zweilight-bg))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,void-pink :background ,zweilight-bg))))
   `(helm-match ((t (:foreground ,void-cyan :weight bold))))
   `(helm-moccur-buffer ((t (:foreground ,void-orange :background ,zweilight-bg))))
   `(helm-mu-contacts-address-face ((t (:foreground ,zweilight-fg-1 :background ,zweilight-bg))))
   `(helm-mu-contacts-name-face ((t (:foreground ,zweilight-fg :background ,zweilight-bg))))
;;;;; helm-swoop
   `(helm-swoop-target-line-face ((t (:foreground ,zweilight-fg :background ,zweilight-bg+1))))
   `(helm-swoop-target-word-face ((t (:foreground ,zweilight-yellow :background ,zweilight-bg+2 :weight bold))))
;;;;; hl-line-mode
   `(hl-line-face ((,class (:background ,zweilight-bg-05))
                   (t :weight bold)))
   `(hl-line ((,class (:background ,zweilight-bg-05)) ; old emacsen
              (t :weight bold)))
;;;;; hl-sexp
   `(hl-sexp-face ((,class (:background ,zweilight-bg+1))
                   (t :weight bold)))
;;;;; hydra
   `(hydra-face-red ((t (:foreground ,void-red-pastel+3 :background ,zweilight-bg))))
   `(hydra-face-amaranth ((t (:foreground ,void-red-pastel+1 :background ,zweilight-bg))))
   `(hydra-face-blue ((t (:foreground ,void-blue-pastel+2 :background ,zweilight-bg))))
   `(hydra-face-pink ((t (:foreground ,void-pink+1 :background ,zweilight-bg))))
   `(hydra-face-teal ((t (:foreground ,void-orange :background ,zweilight-bg))))
;;;; ivy
   `(ivy-confirm-face ((t (:foreground ,void-bg+1 :background ,zweilight-bg))))
   `(ivy-match-required-face ((t (:foreground ,void-pink :background ,zweilight-bg))))
   `(ivy-remote ((t (:foreground ,void-blue-pastel+2 :background ,zweilight-bg))))
   `(ivy-subdir ((t (:foreground ,zweilight-yellow :background ,zweilight-bg))))
   `(ivy-current-match ((t (:foreground ,zweilight-yellow :weight bold :underline t))))
   `(ivy-minibuffer-match-face-1 ((t (:background ,zweilight-bg+1))))
   `(ivy-minibuffer-match-face-2 ((t (:background ,void-bg+1))))
   `(ivy-minibuffer-match-face-3 ((t (:background ,void-bg+1))))
   `(ivy-minibuffer-match-face-4 ((t (:background ,void-bg))))
;;;;; ido-mode
   `(ido-first-match ((t (:foreground ,zweilight-yellow :weight bold))))
   `(ido-only-match ((t (:foreground ,zweilight-orange :weight bold))))
   `(ido-subdir ((t (:foreground ,zweilight-yellow))))
   `(ido-indicator ((t (:foreground ,zweilight-yellow :background ,void-red-pastel))))
;;;;; iedit-mode
   `(iedit-occurrence ((t (:background ,zweilight-bg+2 :weight bold))))
;;;;; jabber-mode
   `(jabber-roster-user-away ((t (:foreground ,void-bg+1))))
   `(jabber-roster-user-online ((t (:foreground ,void-cyan))))
   `(jabber-roster-user-dnd ((t (:foreground ,void-red-pastel+4))))
   `(jabber-roster-user-xa ((t (:foreground ,void-pink+1))))
   `(jabber-roster-user-chatty ((t (:foreground ,zweilight-orange))))
   `(jabber-roster-user-error ((t (:foreground ,void-red-pastel+4))))
   `(jabber-rare-time-face ((t (:foreground ,void-bg))))
   `(jabber-chat-prompt-local ((t (:foreground ,void-cyan))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,void-red-pastel+4))))
   `(jabber-chat-prompt-system ((t (:foreground ,void-green))))
   `(jabber-activity-face((t (:foreground ,void-red-pastel+4))))
   `(jabber-activity-personal-face ((t (:foreground ,void-orange))))
   `(jabber-title-small ((t (:height 1.1 :weight bold))))
   `(jabber-title-medium ((t (:height 1.2 :weight bold))))
   `(jabber-title-large ((t (:height 1.3 :weight bold))))
;;;;; js2-mode
   `(js2-warning ((t (:underline ,zweilight-orange))))
   `(js2-error ((t (:foreground ,void-pink :weight bold))))
   `(js2-jsdoc-tag ((t (:foreground ,void-bg+1))))
   `(js2-jsdoc-type ((t (:foreground ,void-bg+1))))
   `(js2-jsdoc-value ((t (:foreground ,void-green))))
   `(js2-function-param ((t (:foreground, zweilight-orange))))
   `(js2-external-variable ((t (:foreground ,zweilight-orange))))
;;;;; additional js2 mode attributes for better syntax highlighting
   `(js2-instance-member ((t (:foreground ,void-bg+1))))
   `(js2-jsdoc-html-tag-delimiter ((t (:foreground ,zweilight-orange))))
   `(js2-jsdoc-html-tag-name ((t (:foreground ,void-red-pastel+3))))
   `(js2-object-property ((t (:foreground ,void-orange))))
   `(js2-magic-paren ((t (:foreground ,void-bg))))
   `(js2-private-function-call ((t (:foreground ,void-orange))))
   `(js2-function-call ((t (:foreground ,void-orange))))
   `(js2-private-member ((t (:foreground ,void-cyan))))
   `(js2-keywords ((t (:foreground ,void-pink+1))))
;;;;; ledger-mode
   `(ledger-font-payee-uncleared-face ((t (:foreground ,void-red-pastel+3 :weight bold))))
   `(ledger-font-payee-cleared-face ((t (:foreground ,zweilight-fg :weight normal))))
   `(ledger-font-xact-highlight-face ((t (:background ,zweilight-bg+1))))
   `(ledger-font-pending-face ((t (:foreground ,zweilight-orange weight: normal))))
   `(ledger-font-other-face ((t (:foreground ,zweilight-fg))))
   `(ledger-font-posting-account-face ((t (:foreground ,void-cyan))))
   `(ledger-font-posting-account-cleared-face ((t (:foreground ,zweilight-fg))))
   `(ledger-font-posting-account-pending-face ((t (:foreground ,zweilight-orange))))
   `(ledger-font-posting-amount-face ((t (:foreground ,zweilight-orange))))
   `(ledger-occur-narrowed-face ((t (:foreground ,zweilight-fg-1 :invisible t))))
   `(ledger-occur-xact-face ((t (:background ,zweilight-bg+1))))
   `(ledger-font-comment-face ((t (:foreground ,void-bg+1))))
   `(ledger-font-reconciler-uncleared-face ((t (:foreground ,void-red-pastel+3 :weight bold))))
   `(ledger-font-reconciler-cleared-face ((t (:foreground ,zweilight-fg :weight normal))))
   `(ledger-font-reconciler-pending-face ((t (:foreground ,zweilight-orange :weight normal))))
   `(ledger-font-report-clickable-face ((t (:foreground ,zweilight-orange :weight normal))))
;;;;; linum-mode
   `(linum ((t (:foreground ,void-bg+1 :background ,zweilight-bg))))
;;;;; lispy
   `(lispy-command-name-face ((t (:background ,zweilight-bg-05 :inherit font-lock-function-name-face))))
   `(lispy-cursor-face ((t (:foreground ,zweilight-bg :background ,zweilight-fg))))
   `(lispy-face-hint ((t (:inherit highlight :foreground ,zweilight-yellow))))
;;;;; ruler-mode
   `(ruler-mode-column-number ((t (:inherit 'ruler-mode-default :foreground ,zweilight-fg))))
   `(ruler-mode-fill-column ((t (:inherit 'ruler-mode-default :foreground ,zweilight-yellow))))
   `(ruler-mode-goal-column ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-comment-column ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-tab-stop ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-current-column ((t (:foreground ,zweilight-yellow :box t))))
   `(ruler-mode-default ((t (:foreground ,void-bg+1 :background ,zweilight-bg))))

;;;;; lui
   `(lui-time-stamp-face ((t (:foreground ,void-cyan))))
   `(lui-hilight-face ((t (:foreground ,void-bg+1 :background ,zweilight-bg))))
   `(lui-button-face ((t (:inherit hover-highlight))))
;;;;; macrostep
   `(macrostep-gensym-1
     ((t (:foreground ,void-bg+1 :background ,void-cyan))))
   `(macrostep-gensym-2
     ((t (:foreground ,void-red-pastel+4 :background ,void-cyan))))
   `(macrostep-gensym-3
     ((t (:foreground ,void-orange :background ,void-cyan))))
   `(macrostep-gensym-4
     ((t (:foreground ,void-pink+1 :background ,void-cyan))))
   `(macrostep-gensym-5
     ((t (:foreground ,zweilight-yellow :background ,void-cyan))))
   `(macrostep-expansion-highlight-face
     ((t (:inherit highlight))))
   `(macrostep-macro-face
     ((t (:underline t))))
;;;;; magit
;;;;;; headings and diffs
   `(magit-section-highlight           ((t (:background ,zweilight-bg+05))))
   `(magit-section-heading             ((t (:foreground ,zweilight-yellow :weight bold))))
   `(magit-section-heading-selection   ((t (:foreground ,zweilight-orange :weight bold))))
   `(magit-diff-file-heading           ((t (:weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,zweilight-bg+05  :weight bold))))
   `(magit-diff-file-heading-selection ((t (:background ,zweilight-bg+05
                                                        :foreground ,zweilight-orange :weight bold))))
   `(magit-diff-hunk-heading           ((t (:background ,zweilight-bg+1))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,zweilight-bg+2))))
   `(magit-diff-hunk-heading-selection ((t (:background ,zweilight-bg+2
                                                        :foreground ,zweilight-orange))))
   `(magit-diff-lines-heading          ((t (:background ,zweilight-orange
                                                        :foreground ,zweilight-bg+2))))
   `(magit-diff-context-highlight      ((t (:background ,zweilight-bg+05
                                                        :foreground "grey70"))))
   `(magit-diffstat-added   ((t (:foreground ,void-yellow))))
   `(magit-diffstat-removed ((t (:foreground ,void-pink))))
;;;;;; popup
   `(magit-popup-heading             ((t (:foreground ,zweilight-yellow  :weight bold))))
   `(magit-popup-key                 ((t (:foreground ,void-bg+1 :weight bold))))
   `(magit-popup-argument            ((t (:foreground ,void-bg+1   :weight bold))))
   `(magit-popup-disabled-argument   ((t (:foreground ,zweilight-fg-1    :weight normal))))
   `(magit-popup-option-value        ((t (:foreground ,void-blue-pastel+1  :weight bold))))
;;;;;; process
   `(magit-process-ok    ((t (:foreground ,void-bg+1  :weight bold))))
   `(magit-process-ng    ((t (:foreground ,void-pink    :weight bold))))
;;;;;; log
   `(magit-log-author    ((t (:foreground ,zweilight-orange))))
   `(magit-log-date      ((t (:foreground ,zweilight-fg-1))))
   `(magit-log-graph     ((t (:foreground ,void-yellow))))
;;;;;; sequence
   `(magit-sequence-pick ((t (:foreground ,void-yellow))))
   `(magit-sequence-stop ((t (:foreground ,void-bg+1))))
   `(magit-sequence-part ((t (:foreground ,zweilight-yellow))))
   `(magit-sequence-head ((t (:foreground ,void-blue-pastel+2))))
   `(magit-sequence-drop ((t (:foreground ,void-pink))))
   `(magit-sequence-done ((t (:foreground ,zweilight-fg-1))))
   `(magit-sequence-onto ((t (:foreground ,zweilight-fg-1))))
;;;;;; bisect
   `(magit-bisect-good ((t (:foreground ,void-bg+1))))
   `(magit-bisect-skip ((t (:foreground ,zweilight-yellow))))
   `(magit-bisect-bad  ((t (:foreground ,void-pink))))
;;;;;; blame
   `(magit-blame-heading ((t (:background ,void-cyan :foreground ,void-blue-pastel+1))))
   `(magit-blame-hash    ((t (:background ,void-cyan :foreground ,void-blue-pastel+1))))
   `(magit-blame-name    ((t (:background ,void-cyan :foreground ,zweilight-orange))))
   `(magit-blame-date    ((t (:background ,void-cyan :foreground ,zweilight-orange))))
   `(magit-blame-summary ((t (:background ,void-cyan :foreground ,void-blue-pastel+1
                                          :weight bold))))
;;;;;; references etc
   `(magit-dimmed         ((t (:foreground ,zweilight-bg+3))))
   `(magit-hash           ((t (:foreground ,zweilight-bg+3))))
   `(magit-tag            ((t (:foreground ,zweilight-orange :weight bold))))
   `(magit-branch-remote  ((t (:foreground ,void-bg+1  :weight bold))))
   `(magit-branch-local   ((t (:foreground ,void-blue-pastel+2   :weight bold))))
   `(magit-branch-current ((t (:foreground ,void-blue-pastel+2   :weight bold :box t))))
   `(magit-head           ((t (:foreground ,void-blue-pastel+2   :weight bold))))
   `(magit-refname        ((t (:background ,zweilight-bg+2 :foreground ,zweilight-fg :weight bold))))
   `(magit-refname-stash  ((t (:background ,zweilight-bg+2 :foreground ,zweilight-fg :weight bold))))
   `(magit-refname-wip    ((t (:background ,zweilight-bg+2 :foreground ,zweilight-fg :weight bold))))
   `(magit-signature-good      ((t (:foreground ,void-bg+1))))
   `(magit-signature-bad       ((t (:foreground ,void-pink))))
   `(magit-signature-untrusted ((t (:foreground ,zweilight-yellow))))
   `(magit-cherry-unmatched    ((t (:foreground ,void-orange))))
   `(magit-cherry-equivalent   ((t (:foreground ,void-pink+1))))
   `(magit-reflog-commit       ((t (:foreground ,void-bg+1))))
   `(magit-reflog-amend        ((t (:foreground ,void-pink+1))))
   `(magit-reflog-merge        ((t (:foreground ,void-bg+1))))
   `(magit-reflog-checkout     ((t (:foreground ,void-blue-pastel+2))))
   `(magit-reflog-reset        ((t (:foreground ,void-pink))))
   `(magit-reflog-rebase       ((t (:foreground ,void-pink+1))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,void-bg+1))))
   `(magit-reflog-remote       ((t (:foreground ,void-orange))))
   `(magit-reflog-other        ((t (:foreground ,void-orange))))
;;;;; message-mode
   `(message-cited-text ((t (:inherit font-lock-comment-face))))
   `(message-header-name ((t (:foreground ,void-bg))))
   `(message-header-other ((t (:foreground ,void-bg+1))))
   `(message-header-to ((t (:foreground ,zweilight-yellow :weight bold))))
   `(message-header-cc ((t (:foreground ,zweilight-yellow :weight bold))))
   `(message-header-newsgroups ((t (:foreground ,zweilight-yellow :weight bold))))
   `(message-header-subject ((t (:foreground ,zweilight-orange :weight bold))))
   `(message-header-xheader ((t (:foreground ,void-bg+1))))
   `(message-mml ((t (:foreground ,zweilight-yellow :weight bold))))
   `(message-separator ((t (:inherit font-lock-comment-face))))
;;;;; mew
   `(mew-face-header-subject ((t (:foreground ,zweilight-orange))))
   `(mew-face-header-from ((t (:foreground ,zweilight-yellow))))
   `(mew-face-header-date ((t (:foreground ,void-bg+1))))
   `(mew-face-header-to ((t (:foreground ,void-pink))))
   `(mew-face-header-key ((t (:foreground ,void-bg+1))))
   `(mew-face-header-private ((t (:foreground ,void-bg+1))))
   `(mew-face-header-important ((t (:foreground ,void-blue-pastel+2))))
   `(mew-face-header-marginal ((t (:foreground ,zweilight-fg :weight bold))))
   `(mew-face-header-warning ((t (:foreground ,void-pink))))
   `(mew-face-header-xmew ((t (:foreground ,void-bg+1))))
   `(mew-face-header-xmew-bad ((t (:foreground ,void-pink))))
   `(mew-face-body-url ((t (:foreground ,zweilight-orange))))
   `(mew-face-body-comment ((t (:foreground ,zweilight-fg :slant italic))))
   `(mew-face-body-cite1 ((t (:foreground ,void-bg+1))))
   `(mew-face-body-cite2 ((t (:foreground ,void-blue-pastel+2))))
   `(mew-face-body-cite3 ((t (:foreground ,zweilight-orange))))
   `(mew-face-body-cite4 ((t (:foreground ,zweilight-yellow))))
   `(mew-face-body-cite5 ((t (:foreground ,void-pink))))
   `(mew-face-mark-review ((t (:foreground ,void-blue-pastel+2))))
   `(mew-face-mark-escape ((t (:foreground ,void-bg+1))))
   `(mew-face-mark-delete ((t (:foreground ,void-pink))))
   `(mew-face-mark-unlink ((t (:foreground ,zweilight-yellow))))
   `(mew-face-mark-refile ((t (:foreground ,void-bg+1))))
   `(mew-face-mark-unread ((t (:foreground ,void-red-pastel+2))))
   `(mew-face-eof-message ((t (:foreground ,void-bg+1))))
   `(mew-face-eof-part ((t (:foreground ,zweilight-yellow))))
;;;;; mic-paren
   `(paren-face-match ((t (:foreground ,void-orange :background ,zweilight-bg :weight bold))))
   `(paren-face-mismatch ((t (:foreground ,zweilight-bg :background ,void-pink+1 :weight bold))))
   `(paren-face-no-match ((t (:foreground ,zweilight-bg :background ,void-pink :weight bold))))
;;;;; mingus
   `(mingus-directory-face ((t (:foreground ,void-blue-pastel+2))))
   `(mingus-pausing-face ((t (:foreground ,void-pink+1))))
   `(mingus-playing-face ((t (:foreground ,void-orange))))
   `(mingus-playlist-face ((t (:foreground ,void-orange ))))
   `(mingus-song-file-face ((t (:foreground ,zweilight-yellow))))
   `(mingus-stopped-face ((t (:foreground ,void-pink))))
;;;;; nav
   `(nav-face-heading ((t (:foreground ,zweilight-yellow))))
   `(nav-face-button-num ((t (:foreground ,void-orange))))
   `(nav-face-dir ((t (:foreground ,void-bg+1))))
   `(nav-face-hdir ((t (:foreground ,void-pink))))
   `(nav-face-file ((t (:foreground ,zweilight-fg))))
   `(nav-face-hfile ((t (:foreground ,void-red-pastel))))
;;;;; mu4e
   `(mu4e-cited-1-face ((t (:foreground ,void-blue-pastel+2    :slant italic))))
   `(mu4e-cited-2-face ((t (:foreground ,void-bg+1 :slant italic))))
   `(mu4e-cited-3-face ((t (:foreground ,void-blue-pastel+1  :slant italic))))
   `(mu4e-cited-4-face ((t (:foreground ,void-bg+1   :slant italic))))
   `(mu4e-cited-5-face ((t (:foreground ,void-yellow  :slant italic))))
   `(mu4e-cited-6-face ((t (:foreground ,void-bg+1 :slant italic))))
   `(mu4e-cited-7-face ((t (:foreground ,void-blue-pastel+2    :slant italic))))
   `(mu4e-replied-face ((t (:foreground ,zweilight-bg+3))))
   `(mu4e-trashed-face ((t (:foreground ,zweilight-bg+3 :strike-through t))))
;;;;; mumamo
   `(mumamo-background-chunk-major ((t (:background nil))))
   `(mumamo-background-chunk-submode1 ((t (:background ,void-cyan))))
   `(mumamo-background-chunk-submode2 ((t (:background ,zweilight-bg+2))))
   `(mumamo-background-chunk-submode3 ((t (:background ,zweilight-bg+3))))
   `(mumamo-background-chunk-submode4 ((t (:background ,zweilight-bg+1))))
;;;;; org-mode
   `(org-agenda-date-today
     ((t (:foreground ,void-yellow :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((t (:inherit font-lock-comment-face))))
   `(org-archived ((t (:foreground ,zweilight-fg :weight bold))))
   `(org-checkbox ((t (:background ,zweilight-bg+2 :foreground ,void-yellow
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,void-blue-pastel+2 :underline t))))
   `(org-deadline-announce ((t (:foreground ,void-red-pastel+3))))
   `(org-done ((t (:bold t :weight bold :foreground ,void-green))))
   `(org-formula ((t (:foreground ,void-yellow))))
   `(org-headline-done ((t (:foreground ,void-green))))
   `(org-hide ((t (:foreground ,void-cyan))))
   `(org-level-1 ((t (:weight bold :foreground ,zweilight-orange))))
   `(org-level-2 ((t (:foreground ,void-yellow))))
   `(org-level-3 ((t (:foreground ,void-cyan))))
   `(org-level-4 ((t (:foreground ,void-yellow))))
   `(org-level-5 ((t (:foreground ,void-orange))))
   `(org-level-6 ((t (:foreground ,void-bg+1))))
   `(org-level-7 ((t (:foreground ,void-red-pastel))))
   `(org-level-8 ((t (:foreground ,void-yellow))))
   `(org-link ((t (:foreground ,void-yellow :underline t))))
   `(org-scheduled ((t (:foreground ,void-yellow))))
   `(org-scheduled-previously ((t (:foreground ,void-pink))))
   `(org-scheduled-today ((t (:foreground ,void-orange))))
   `(org-sexp-date ((t (:foreground ,void-orange :underline t))))
   `(org-special-keyword ((t (:inherit font-lock-comment-face))))
   `(org-table ((t (:foreground ,void-bg+1))))
   `(org-tag ((t (:bold t :weight bold))))
   `(org-time-grid ((t (:foreground ,zweilight-orange))))
   `(org-todo ((t (:bold t :foreground ,void-pink :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:bold t :foreground ,void-pink :weight bold :underline nil))))
   `(org-column ((t (:background ,void-cyan))))
   `(org-column-title ((t (:background ,void-cyan :underline t :weight bold))))
   `(org-mode-line-clock ((t (:foreground ,zweilight-fg :background ,void-cyan))))
   `(org-mode-line-clock-overrun ((t (:foreground ,zweilight-bg :background ,void-red-pastel+3))))
   `(org-ellipsis ((t (:foreground ,void-yellow+1 :underline t))))
   `(org-footnote ((t (:foreground ,void-orange :underline t))))
   `(org-document-title ((t (:foreground ,void-blue-pastel+2))))
   `(org-document-info ((t (:foreground ,void-blue-pastel+2))))
   `(org-habit-ready-face ((t :background ,void-bg+1)))
   `(org-habit-alert-face ((t :background ,void-yellow+1 :foreground ,zweilight-bg)))
   `(org-habit-clear-face ((t :background ,void-blue-pastel)))
   `(org-habit-overdue-face ((t :background ,void-red-pastel+1)))
   `(org-habit-clear-future-face ((t :background ,void-yellow)))
   `(org-habit-ready-future-face ((t :background ,void-bg+1)))
   `(org-habit-alert-future-face ((t :background ,void-yellow :foreground ,zweilight-bg)))
   `(org-habit-overdue-future-face ((t :background ,void-red-pastel)))
;;;;; outline
   `(outline-1 ((t (:foreground ,zweilight-orange))))
   `(outline-2 ((t (:foreground ,void-yellow))))
   `(outline-3 ((t (:foreground ,void-cyan))))
   `(outline-4 ((t (:foreground ,void-yellow))))
   `(outline-5 ((t (:foreground ,void-orange))))
   `(outline-6 ((t (:foreground ,void-bg+1))))
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
   `(powerline-active1 ((t (:background ,zweilight-bg-05 :inherit mode-line))))
   `(powerline-active2 ((t (:background ,zweilight-bg+2 :inherit mode-line))))
   `(powerline-inactive1 ((t (:background ,zweilight-bg+1 :inherit mode-line-inactive))))
   `(powerline-inactive2 ((t (:background ,zweilight-bg+3 :inherit mode-line-inactive))))
;;;;; proofgeneral
   `(proof-active-area-face ((t (:underline t))))
   `(proof-boring-face ((t (:foreground ,zweilight-fg :background ,zweilight-bg+2))))
   `(proof-command-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-debug-message-face ((t (:inherit proof-boring-face))))
   `(proof-declaration-name-face ((t (:inherit font-lock-keyword-face :foreground nil))))
   `(proof-eager-annotation-face ((t (:foreground ,zweilight-bg :background ,zweilight-orange))))
   `(proof-error-face ((t (:foreground ,zweilight-fg :background ,void-red-pastel))))
   `(proof-highlight-dependency-face ((t (:foreground ,zweilight-bg :background ,void-yellow+1))))
   `(proof-highlight-dependent-face ((t (:foreground ,zweilight-bg :background ,zweilight-orange))))
   `(proof-locked-face ((t (:background ,void-bg))))
   `(proof-mouse-highlight-face ((t (:foreground ,zweilight-bg :background ,zweilight-orange))))
   `(proof-queue-face ((t (:background ,void-red-pastel))))
   `(proof-region-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-script-highlight-error-face ((t (:background ,void-red-pastel+2))))
   `(proof-tacticals-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,zweilight-bg))))
   `(proof-tactics-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,zweilight-bg))))
   `(proof-warning-face ((t (:foreground ,zweilight-bg :background ,void-yellow+1))))
;;;;; racket-mode
   `(racket-keyword-argument-face ((t (:inherit font-lock-constant-face))))
   `(racket-selfeval-face ((t (:inherit font-lock-type-face))))
;;;;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,zweilight-fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,void-yellow))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,void-yellow))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,void-orange))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,void-bg+1))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,void-orange))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,void-yellow+1))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,void-bg))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,void-blue-pastel+1))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,zweilight-orange))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,void-bg+1))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,void-bg))))
;;;;; rcirc
   `(rcirc-my-nick ((t (:foreground ,void-blue-pastel+2))))
   `(rcirc-other-nick ((t (:foreground ,zweilight-orange))))
   `(rcirc-bright-nick ((t (:foreground ,void-orange))))
   `(rcirc-dim-nick ((t (:foreground ,void-blue-pastel+1))))
   `(rcirc-server ((t (:foreground ,void-bg+1))))
   `(rcirc-server-prefix ((t (:foreground ,void-bg))))
   `(rcirc-timestamp ((t (:foreground ,void-bg+1))))
   `(rcirc-nick-in-message ((t (:foreground ,zweilight-yellow))))
   `(rcirc-nick-in-message-full-line ((t (:bold t))))
   `(rcirc-prompt ((t (:foreground ,zweilight-yellow :bold t))))
   `(rcirc-track-nick ((t (:inverse-video t))))
   `(rcirc-track-keyword ((t (:bold t))))
   `(rcirc-url ((t (:bold t))))
   `(rcirc-keyword ((t (:foreground ,zweilight-yellow :bold t))))
;;;;; rpm-mode
   `(rpm-spec-dir-face ((t (:foreground ,void-bg+1))))
   `(rpm-spec-doc-face ((t (:foreground ,void-bg+1))))
   `(rpm-spec-ghost-face ((t (:foreground ,void-pink))))
   `(rpm-spec-macro-face ((t (:foreground ,zweilight-yellow))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground ,void-pink))))
   `(rpm-spec-package-face ((t (:foreground ,void-pink))))
   `(rpm-spec-section-face ((t (:foreground ,zweilight-yellow))))
   `(rpm-spec-tag-face ((t (:foreground ,void-blue-pastel+2))))
   `(rpm-spec-var-face ((t (:foreground ,void-pink))))
;;;;; rst-mode
   `(rst-level-1-face ((t (:foreground ,zweilight-orange))))
   `(rst-level-2-face ((t (:foreground ,void-bg))))
   `(rst-level-3-face ((t (:foreground ,void-cyan))))
   `(rst-level-4-face ((t (:foreground ,void-yellow))))
   `(rst-level-5-face ((t (:foreground ,void-orange))))
   `(rst-level-6-face ((t (:foreground ,void-bg+1))))
;;;;; sh-mode
   `(sh-heredoc     ((t (:foreground ,zweilight-yellow :bold t))))
   `(sh-quoted-exec ((t (:foreground ,void-pink))))
;;;;; show-paren
   `(show-paren-mismatch ((t (:foreground ,void-red-pastel+4 :background ,zweilight-bg+3 :weight bold))))
   `(show-paren-match ((t (:foreground ,zweilight-yellow :background ,zweilight-bg+3 :weight bold))))
;;;;; smart-mode-line
   ;; use (setq sml/theme nil) to enable Zweilight for sml
   `(sml/global ((,class (:foreground ,zweilight-fg :weight bold))))
   `(sml/modes ((,class (:foreground ,zweilight-yellow :weight bold))))
   `(sml/minor-modes ((,class (:foreground ,zweilight-fg-1 :weight bold))))
   `(sml/filename ((,class (:foreground ,zweilight-yellow :weight bold))))
   `(sml/line-number ((,class (:foreground ,void-blue-pastel+2 :weight bold))))
   `(sml/col-number ((,class (:foreground ,void-orange :weight bold))))
   `(sml/position-percentage ((,class (:foreground ,void-cyan :weight bold))))
   `(sml/prefix ((,class (:foreground ,zweilight-orange))))
   `(sml/git ((,class (:foreground ,void-green))))
   `(sml/process ((,class (:weight bold))))
   `(sml/sudo ((,class  (:foreground ,zweilight-orange :weight bold))))
   `(sml/read-only ((,class (:foreground ,void-red-pastel+2))))
   `(sml/outside-modified ((,class (:foreground ,zweilight-orange))))
   `(sml/modified ((,class (:foreground ,void-pink))))
   `(sml/vc-edited ((,class (:foreground ,void-bg+1))))
   `(sml/charging ((,class (:foreground ,void-yellow))))
   `(sml/discharging ((,class (:foreground ,void-red-pastel+4))))
;;;;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,void-red-pastel+4 :background ,zweilight-bg+3 :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,zweilight-bg+3 :weight bold))))
;;;;; sml-mode-line
   '(sml-modeline-end-face ((t :inherit default :width condensed)))
;;;;; SLIME
   `(slime-repl-output-face ((t (:foreground ,void-pink))))
   `(slime-repl-inputed-output-face ((t (:foreground ,void-bg+1))))
   `(slime-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-pink)))
      (t
       (:underline ,void-pink))))
   `(slime-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zweilight-orange)))
      (t
       (:underline ,zweilight-orange))))
   `(slime-style-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zweilight-yellow)))
      (t
       (:underline ,zweilight-yellow))))
   `(slime-note-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,void-bg+1)))
      (t
       (:underline ,void-bg+1))))
   `(slime-highlight-face ((t (:inherit highlight))))
;;;;; speedbar
   `(speedbar-button-face ((t (:foreground ,void-bg+1))))
   `(speedbar-directory-face ((t (:foreground ,void-orange))))
   `(speedbar-file-face ((t (:foreground ,zweilight-fg))))
   `(speedbar-highlight-face ((t (:foreground ,zweilight-bg :background ,void-bg+1))))
   `(speedbar-selected-face ((t (:foreground ,void-pink))))
   `(speedbar-separator-face ((t (:foreground ,zweilight-bg :background ,void-cyan))))
   `(speedbar-tag-face ((t (:foreground ,zweilight-yellow))))
;;;;; tabbar
   `(tabbar-button ((t (:foreground ,zweilight-fg
                                    :background ,zweilight-bg))))
   `(tabbar-selected ((t (:foreground ,zweilight-fg
                                      :background ,zweilight-bg
                                      :box (:line-width -1 :style pressed-button)))))
   `(tabbar-unselected ((t (:foreground ,zweilight-fg
                                        :background ,zweilight-bg+1
                                        :box (:line-width -1 :style released-button)))))
;;;;; term
   `(term-color-black ((t (:foreground ,zweilight-bg
                                       :background ,void-cyan))))
   `(term-color-red ((t (:foreground ,void-red-pastel+2
                                     :background ,void-red-pastel))))
   `(term-color-green ((t (:foreground ,void-bg+1
                                       :background ,void-bg+1))))
   `(term-color-yellow ((t (:foreground ,zweilight-orange
                                        :background ,zweilight-yellow))))
   `(term-color-blue ((t (:foreground ,void-cyan
                                      :background ,void-yellow))))
   `(term-color-magenta ((t (:foreground ,void-pink+1
                                         :background ,void-pink))))
   `(term-color-cyan ((t (:foreground ,void-orange
                                      :background ,void-blue-pastel+2))))
   `(term-color-white ((t (:foreground ,zweilight-fg
                                       :background ,zweilight-fg-1))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))
;;;;; undo-tree
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,void-yellow :weight bold))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,void-red-pastel+3 :weight bold))))
   `(undo-tree-visualizer-default-face ((t (:foreground ,zweilight-fg))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,zweilight-yellow))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,void-orange))))
;;;;; volatile-highlights
   `(vhl/default-face ((t (:background ,zweilight-bg-05))))
;;;;; web-mode
   `(web-mode-builtin-face ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face ((t (:foreground ,zweilight-orange ))))
   `(web-mode-css-prop-face ((t (:foreground ,zweilight-orange))))
   `(web-mode-css-pseudo-class-face ((t (:foreground ,void-green :weight bold))))
   `(web-mode-css-rule-face ((t (:foreground ,void-blue-pastel+2))))
   `(web-mode-doctype-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face ((t (:underline t))))
   `(web-mode-function-name-face ((t (:foreground ,void-blue-pastel+2))))
   `(web-mode-html-attr-name-face ((t (:foreground ,zweilight-orange))))
   `(web-mode-html-attr-value-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face ((t (:foreground ,void-orange))))
   `(web-mode-keyword-face ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face ((t (:background ,zweilight-bg))))
   `(web-mode-server-comment-face ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face ((t (:background ,void-pink))))
;;;;; whitespace-mode
   `(whitespace-space ((t (:background ,zweilight-bg+1 :foreground ,zweilight-bg+1))))
   `(whitespace-hspace ((t (:background ,zweilight-bg+1 :foreground ,zweilight-bg+1))))
   `(whitespace-tab ((t (:background ,void-red-pastel+3))))
   `(whitespace-newline ((t (:foreground ,zweilight-bg+1))))
   `(whitespace-trailing ((t (:background ,void-pink))))
   `(whitespace-line ((t (:background ,zweilight-bg :foreground ,void-pink+1))))
   `(whitespace-space-before-tab ((t (:background ,zweilight-orange :foreground ,zweilight-orange))))
   `(whitespace-indentation ((t (:background ,zweilight-yellow :foreground ,void-pink))))
   `(whitespace-empty ((t (:background ,zweilight-yellow))))
   `(whitespace-space-after-tab ((t (:background ,zweilight-yellow :foreground ,void-pink))))
;;;;; wanderlust
   `(wl-highlight-folder-few-face ((t (:foreground ,void-red-pastel+2))))
   `(wl-highlight-folder-many-face ((t (:foreground ,void-red-pastel+3))))
   `(wl-highlight-folder-path-face ((t (:foreground ,zweilight-orange))))
   `(wl-highlight-folder-unread-face ((t (:foreground ,void-blue-pastel+2))))
   `(wl-highlight-folder-zero-face ((t (:foreground ,zweilight-fg))))
   `(wl-highlight-folder-unknown-face ((t (:foreground ,void-blue-pastel+2))))
   `(wl-highlight-message-citation-header ((t (:foreground ,void-red-pastel+3))))
   `(wl-highlight-message-cited-text-1 ((t (:foreground ,void-pink))))
   `(wl-highlight-message-cited-text-2 ((t (:foreground ,void-bg+1))))
   `(wl-highlight-message-cited-text-3 ((t (:foreground ,void-blue-pastel+2))))
   `(wl-highlight-message-cited-text-4 ((t (:foreground ,void-orange))))
   `(wl-highlight-message-header-contents-face ((t (:foreground ,void-bg+1))))
   `(wl-highlight-message-headers-face ((t (:foreground ,void-red-pastel+4))))
   `(wl-highlight-message-important-header-contents ((t (:foreground ,void-bg+1))))
   `(wl-highlight-message-header-contents ((t (:foreground ,void-bg))))
   `(wl-highlight-message-important-header-contents2 ((t (:foreground ,void-bg+1))))
   `(wl-highlight-message-signature ((t (:foreground ,void-bg+1))))
   `(wl-highlight-message-unimportant-header-contents ((t (:foreground ,zweilight-fg))))
   `(wl-highlight-summary-answered-face ((t (:foreground ,void-blue-pastel+2))))
   `(wl-highlight-summary-disposed-face ((t (:foreground ,zweilight-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((t (:foreground ,void-blue-pastel+2))))
   `(wl-highlight-summary-normal-face ((t (:foreground ,zweilight-fg))))
   `(wl-highlight-summary-thread-top-face ((t (:foreground ,zweilight-yellow))))
   `(wl-highlight-thread-indent-face ((t (:foreground ,void-pink+1))))
   `(wl-highlight-summary-refiled-face ((t (:foreground ,zweilight-fg))))
   `(wl-highlight-summary-displaying-face ((t (:underline t :weight bold))))
;;;;; which-func-mode
   `(which-func ((t (:foreground ,void-yellow))))
;;;;; xcscope
   `(cscope-file-face ((t (:foreground ,zweilight-yellow :weight bold))))
   `(cscope-function-face ((t (:foreground ,void-orange :weight bold))))
   `(cscope-line-number-face ((t (:foreground ,void-pink :weight bold))))
   `(cscope-mouse-face ((t (:foreground ,zweilight-bg :background ,void-orange))))
   `(cscope-separator-face ((t (:foreground ,void-pink :weight bold
                                            :underline t :overline t))))
;;;;; yascroll
   `(yascroll:thumb-text-area ((t (:background ,void-cyan))))
   `(yascroll:thumb-fringe ((t (:background ,void-cyan :foreground ,void-cyan))))

;;;;; highlight-indent-guides
   `(highlight-indent-guides-odd-face ((t (:background ,zweilight-1))))
   `(highlight-indent-guides-even-face ((t (:background ,zweilight-2))))
   ))

;;; Theme Variables
(zweilight-with-color-variables
  (custom-theme-set-variables
   'zweilight
;;;;; ansi-color
   `(ansi-color-names-vector [,zweilight-bg ,void-pink ,void-bg+1 ,zweilight-yellow
                                          ,void-blue-pastel+2 ,void-pink+1 ,void-orange ,zweilight-fg])
;;;;; fill-column-indicator
   `(fci-rule-color ,zweilight-bg-05)
;;;;; nrepl-client
   `(nrepl-message-colors
     '(,void-pink ,zweilight-orange ,zweilight-yellow ,void-bg+1 ,void-yellow
                    ,void-orange ,void-orange ,void-pink+1))
;;;;; vc-annotate
   `(vc-annotate-color-map
     '(( 20. . ,void-red-pastel+3)
       ( 40. . ,void-pink)
       ( 60. . ,zweilight-orange)
       ( 80. . ,void-yellow)
       (100. . ,void-yellow+1)
       (120. . ,zweilight-yellow)
       (140. . ,void-bg+1)
       (160. . ,void-bg+1)
       (180. . ,void-bg)
       (200. . ,void-bg+1)
       (220. . ,void-green)
       (240. . ,void-yellow)
       (260. . ,void-orange)
       (280. . ,void-blue-pastel+1)
       (300. . ,void-cyan)
       (320. . ,void-blue-pastel+2)
       (340. . ,void-orange)
       (360. . ,void-pink+1)))
   `(vc-annotate-very-old-color ,void-pink+1)
   `(vc-annotate-background ,void-cyan)
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
