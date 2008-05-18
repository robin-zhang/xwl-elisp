;;; generic-apt-apt-get.el --- apt-get backend

;; Copyright (C) 2008 William Xu

;; Author: William Xu <william.xwl@gmail.com>
;; Version: 0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
;; MA 02110-1301, USA.

;;; Code:

(require 'generic-apt)

;;; Required Interfaces

(defvar generic-apt-apt-get-font-lock-keywords
  `(("^Package:\\(.*\\)"
     (1 font-lock-function-name-face nil t))
    ("^Conflicts:"
     (0 font-lock-warning-face nil t))
    ("^Description:\\(.*\n\\)"
     (1 font-lock-function-name-face nil t))
    (,(concat
       "^\\("
       (regexp-opt
	'("Package" "Priority" "Section" "Installed-Size" "Maintainer"
	  "Architecture" "Version" "Depends" "Suggests" "Filename"
	  "Size" "MD5sum" "Description" "Tag" "Status" "Replaces"
	  "Conffiles" "Source" "Provides" "Pre-Depends" "Recommends"
          "SHA1" "SHA256" "Enhances" "Config-Version" "Task"))
       "\\):")
     (0 font-lock-keyword-face t t))))

(defun generic-apt-apt-get-edit-sources ()
  '"/etc/apt/sources.list")

(defun generic-apt-apt-get-search (pkg)
  (generic-apt-run-other-command
   (list "apt-cache" "search" "-n" pkg)))

(defun generic-apt-apt-get-update ()
  (generic-apt-run-command (list "update")))

(defun generic-apt-apt-get-install (pkg)
  (generic-apt-run-command (list "install" pkg)))

(defun generic-apt-apt-get-upgrade (pkg)
  (generic-apt-run-command (list "upgrade" pkg)))

(defun generic-apt-apt-get-remove (pkg)
  (generic-apt-run-command (list "remove" pkg)))

(defun generic-apt-apt-get-show (pkg)
  (generic-apt-run-other-command
   (list "apt-cache" "show" pkg)))


(provide 'generic-apt-apt-get)

;;; generic-apt-apt-get.el ends here