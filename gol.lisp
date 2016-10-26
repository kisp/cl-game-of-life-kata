;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:utf-8 -*-

(defpackage :gol
  (:use :cl :5am))

(in-package :gol)

(in-suite* :gol)

(defvar *rules* nil)

(defun find-rule (name)
  (find name *rules*))

(defun name (rule)
  rule)

(defun rule-applicable-p (rule status neighbours)
  (< neighbours 2))

(defmacro define-rule (name
		       &key
			 current
			 alive-neighbours
			 next
		       )
  `(pushnew (list ',name
		  (lambda (status neighbours)
		    ()))
	    *rules*))

(define-rule rule1
    :current :alive
    :alive-neighbours (< 2)
    :next :dead)

(define-rule rule2
    :current :alive
    :alive-neighbours (member (2 3))
    :next :dead)

(define-rule rule3
    :current :alive
    :alive-neighbours (> 3)
    :next :dead)

(define-rule rule4
    :current :dead
    :alive-neighbours (= 3)
    :next :alive)

(test find-rule.1
  (finishes (find-rule 'rule1)))

(test find-rule.2
  (is (eql 'rule1
	   (name (find-rule 'rule1))))
  (is (eql 'rule2
	   (name (find-rule 'rule2)))))

(test call-rule.1
  (let ((r (find-rule 'rule1)))
    (is-true (rule-applicable-p r :alive 0))))

(test call-rule.2
  (let ((r (find-rule 'rule1)))
    (is-false (rule-applicable-p r :alive 5))))

(test call-rule.3
  (let ((r (find-rule 'rule4)))
    (is-true (rule-applicable-p r :dead 3))))
