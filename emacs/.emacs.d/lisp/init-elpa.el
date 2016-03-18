
(require 'package)

; the usual package repos
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

; make sure use-package is installed
; TODO: fix this. it fails to import GPG keys on a fresh install
(unless (package-installed-p 'use-package)
    (package-install 'use-package))

(provide 'init-elpa)
