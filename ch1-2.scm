(print "-- 問題 1.9")
;; 上の例の場合: 再帰的
;(+ 4 5)
;(inc (+ 3 5))
;(inc (inc (+ 2 5)))
;(inc (inc (inc (+ 1 5))))
;(inc (inc (inc (inc (+ 0 5)))))
;(inc (inc (inc (inc 5))))
;(inc (inc (inc 6)))
;(inc (inc 7))
;(inc 8)
;9
;
;; 下の例の場合: 反復的
;(+ 4 5)
;(+ 3 6)
;(+ 2 7)
;(+ 1 8)
;(+ 0 9)
;9
(print "")

(print "-- 問題 1.10")
(define (A x y)
    (cond ((= y 0) 0)
          ((= x 0) (* 2 y))
          ((= y 1) 2)
          (else (A (- x 1)
                   (A x (- y 1))))))

(print "(A 1 10)")
(print (A 1 10))

(print "(A 2 4)")
(print (A 2 4))

(print "(A 3 3)")
(print (A 3 3))

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

(print "(f 0) = " (f 0))
(print "(f 1) = " (f 1))
(print "(f 2) = " (f 2))
(print "(f 3) = " (f 3))
(print "(f 4) = " (f 4))
(print "(f 5) = " (f 5))
(print "=> f(n) = 2n")
(print "")

(print "(g 0) = " (g 0))
(print "(g 1) = " (g 1))
(print "(g 2) = " (g 2))
(print "(g 3) = " (g 3))
(print "(g 4) = " (g 4))
(print "(g 5) = " (g 5))
(print "=> g(n) = 2^n")
(print "")

(print "(h 0) = " (h 0))
(print "(h 1) = " (h 1))
(print "(h 2) = " (h 2))
(print "(h 3) = " (h 3))
(print "(h 4) = " (h 4))
(print "=> h(n) = 2^2^2... ってn回やるやつ")
(print "")

(print "-- 問題 1.11")

(print "再帰的")
(define (f n)
    (cond ((< n 3) n)
          (else (+ (f (- n 1))
                   (* 2 (f (- n 2)))
                   (* 3 (f (- n 3)))))))

(print "(f 1) = " (f 1))
(print "(f 2) = " (f 2))
(print "(f 3) = " (f 3))
; (f 3)
; (+ (f 2) (* 2 (f 1)) (* 3 (f 0)))
; (+ 2 (* 2 1) (* 3 0))
; (+ 2 2 0)
; 4
(print "(f 4) = " (f 4))
; (f 4)
; (+ (f 3) (* 2 (f 2)) (* 3 (f 1)))
; (+ (+ (f 2) (* 2 (f 1)) (* 3 (f 0))) (* 2 2) (* 3 1))
; (+ (+ 2 (* 2 1)) (* 3 0) (* 2 2) (* 3 1))
; (+ (+ 2 2) 0 4 3)
; (+ 4 0 4 3)
; 11
(print "(f 5) = " (f 5))
(print "(f 6) = " (f 6))
(print "")

(print "反復的")
(define (g n)
  (cond ((< n 3) n)
        (else (g-iter 2 1 0 (- n 3)))))

(define (g-iter a b c counter)
  (if (< counter 0)
      a
      (g-iter (+ a (* 2 b) (* 3 c))
              a
              b
              (- counter 1))))

(print "(g 1) = " (g 1))
(print "(g 2) = " (g 2))
(print "(g 3) = " (g 3))
(print "(g 4) = " (g 4))
(print "(g 5) = " (g 5))
(print "(g 6) = " (g 6))
(print "")

(print "-- 問題 1.12")

(define (f x y)
  (cond ((or (= x 1) (= y 1) (= x y)) 1)
        (else (+ (f (- x 1) (- y 1))
                  (f (- x 1) y)))))

(print "1行目")
(print "(f 1 1) = " (f 1 1))
(print "2行目")
(print "(f 2 1) = " (f 2 1))
(print "(f 2 2) = " (f 2 2))
(print "3行目")
(print "(f 3 1) = " (f 3 1))
(print "(f 3 2) = " (f 3 2))
(print "(f 3 3) = " (f 3 3))
(print "4行目")
(print "(f 4 1) = " (f 4 1))
(print "(f 4 2) = " (f 4 2))
(print "(f 4 3) = " (f 4 3))
(print "(f 4 4) = " (f 4 4))
(print "5行目")
(print "(f 5 1) = " (f 5 1))
(print "(f 5 2) = " (f 5 2))
(print "(f 5 3) = " (f 5 3))
(print "(f 5 4) = " (f 5 4))
(print "(f 5 5) = " (f 5 5))

(print "-- 問題 1.13")
(print "")

(print "-- 問題 1.14")
(print "三角形の形で拡大しているから、 Θ (n^2) のような気がする")
(print "")

(print "-- 問題 1.15")

(define (cube x) (* x x x))

(define (p x) (print "p called") (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
    (if (not (> (abs angle) 0.1))
        angle
        (p (sine (/ angle 3.0)))))

(print "(sine 12.15)")
(print (sine 12.15))

(print "(sine 90)")
(print (sine 90))

(print "(sine 180)")
(print (sine 180))

(print "(sine 270)")
(print (sine 270))

(print "pが呼ばれる回数は、Θ (log n) みたいな形で増えているような気がする")
