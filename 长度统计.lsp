
(defun c:linelong( / a n index0 tuyname)
(setq a (ssget))
(setq n (sslength a)) ;求出选择集中的图元数目
(setq index0 0) ;设置计数器
(setq s 0)
(repeat n ;对后面的表达式进行N次计算
(setq tuyname (ssname a index0));返回选择集中由序号指定的图元名
(setq index0 (+ index0 1)) ;计数器加一
(setq ent1 (entget tuyname))
(setq et (length ent1))
(setq et1 et)
(setq index1 0)
(setq test 0)
(setq x2 0)
(setq y2 0)
(setq x1 0 y1 0)
(setq s0 0)
(repeat 2
(setq xy (nth index1 ent1))
;计算line线长
(if (= (cdr xy) "LINE")
(progn
(setq index2 0)
(repeat et1
(setq xy (nth index2 ent1))
(if (= (car xy) 10)
(progn
(setq x1 (nth 1 xy))
(setq y1 (nth 2 xy))
)
)
(if (= (car xy) 11)
(progn
(setq x2 (nth 1 xy))
(setq y2 (nth 2 xy))
)
)
(setq index2 (+ index2 1))
)
(setq s0 (sqrt (+(* (- x2 x1) (- x2 x1)) (* (- y2 y1) (- y2 y1)))))
)
)
;line线计算结束
;计算"LWPOLYLINE"线长
(if (= (cdr xy) "LWPOLYLINE")
(progn
(setq index2 0)
(repeat et1
(setq xy (nth index2 ent1))
(if (= (car xy) 10)
(if (= test 1)
(progn
(setq x2 x1)
(setq y2 y1)
(setq x1 (nth 1 xy))
(setq y1 (nth 2 xy))
(setq s0 (+ s0 (sqrt (+(* (- x2 x1) (- x2 x1)) (* (- y2
y1) (- y2 y1))))))
)
)
)
(if (= (car xy) 10)
(if (= test 0)
(progn
(setq x1 (nth 1 xy))
(setq y1 (nth 2 xy))
(setq test 1)
)
)
)
(setq index2 (+ index2 1))
)
)
)
;计算"LWPOLYLINE"线结束
(setq index1 (+ index1 1))
)
(print s0)
(setq s (+ s s0))
)
(print )
(princ "总长度:")
(princ s)
(setq a nil)
(princ)
)