;;; andersl-cmake-font-lock-test-facit.el --- Regression test CMake font-lock.

;; Copyright (C) 2012-2013 Anders Lindgren

;; Author: Anders Lindgren
;; Keywords: faces languages

;; This program is free software: you can redistribute it and/or modify
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

;; Regression test of `andersl-cmake-font-lock', a package providing
;; font-lock rules for CMake. This module verifies fontification of a
;; number of CMakeLists.txt files taken from real projects. This is
;; done by keeing a text representation of the fontification using
;; `faceup' markup, in addition to the original CMakeLists.txt file.
;;
;; The actual check is performed using `ert', with font-lock test
;; function provided by `faceup'.

;;; Code:

(require 'faceup)

(defvar andersl-cmake-font-lock-test-dir (faceup-this-file-directory))

(defun andersl-cmake-font-lock-test-facit (dir)
  "Test that `dir'/CMakeLists.txt is fontifies as the .faceup file describes.

`dir' is interpreted as relative to this source directory."
  (faceup-test-font-lock-file 'cmake-mode
                              (concat
                               andersl-cmake-font-lock-test-dir
                               dir
                               "/CMakeLists.txt")))
(faceup-defexplainer andersl-cmake-font-lock-test-facit)


(ert-deftest andersl-cmake-font-lock-file-test ()
  (should (andersl-cmake-font-lock-test-facit "facit/grantlee"))
  (should (andersl-cmake-font-lock-test-facit "facit/libarchive"))
  (should (andersl-cmake-font-lock-test-facit "facit/opencollada"))
  (should (andersl-cmake-font-lock-test-facit "facit/gamekit"))
  (should (andersl-cmake-font-lock-test-facit "facit/gazebo"))
  (should (andersl-cmake-font-lock-test-facit "facit/scrapbook"))
  (should (andersl-cmake-font-lock-test-facit "facit/openscenegraph"))
  (should (andersl-cmake-font-lock-test-facit "facit/additions")))

(provide 'andersl-cmake-font-lock-test-facit)

;; andersl-cmake-font-lock-test-facit.el ends here.
