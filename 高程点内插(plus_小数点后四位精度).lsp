(defun c:tt ( / dataop dcl_file dcl_id dgxop dialog_return gc2op gcjl gcjlop gconeop key keys writerimage)
  (vl-load-com)
  (setq writerImage '((8 31 5 31 7) (5 31 5 32 7) (5 32 6 32 7) (6 32 7 32 7) (7 32 8 32 7) (8 32 8 31 7) (6 30 7 30 7) (7 30 6 30 7) (4 29 5 30 7) (5 30 5 39 7) (5 39 6 40 7) (6 40 7 40 7) (7 40 8 40 7) (8 40 9 40 7) (9 40 9 39 7) (9 39 10 39 7) (10 39 7 39 7) (7 39 6 38 7) (6 38 5 38 7) (5 38 5 31 7) (5 31 8 31 7) (8 31 7 31 7) (7 31 6 31 7) (6 31 6 30 7) (6 30 4 29 7) (7 21 7 22 7) (7 22 8 22 7) (8 22 7 21 7) (8 18 7 18 7) (7 18 8 19 7) (8 19 8 20 7) (8 20 8 21 7) (8 21 7 21 7) (7 21 8 22 7) (8 22 8 28 7) (8 28 8 29 7) (8 29 7 29 7) (7 29 4 29 7) (4 29 5 30 7) (5 30 6 30 7) (6 30 7 30 7) (7 30 7 31 7) (7 31 8 31 7) (8 31 8 30 7) (8 30 9 29 7) (9 29 9 27 7) (9 27 9 20 7) (9 20 9 19 7) (9 19 8 18 7) (7 17 7 18 7) (7 18 6 18 7) (6 18 6 20 7) (6 20 7 21 7) (7 21 7 20 7) (7 20 7 19 7) (7 19 8 18 7) (8 18 8 17 7) (8 17 7 17 7) (10 10 7 10 7) (7 10 8 10 7) (8 10 9 10 7) (9 10 9 11 7) (9 11 10 11 7) (10 11 11 12 7) (11 12 11 13 7) (11 13 11 14 7) (11 14 12 15 7) (12 15 12 17 7) (12 17 12 18 7) (12 18 12 19 7) (12 19 12 21 7) (12 21 12 27 7) (12 27 12 28 7) (12 28 12 30 7) (12 30 12 31 7) (12 31 12 32 7) (12 32 11 33 7) (11 33 11 34 7) (11 34 11 35 7) (11 35 11 36 7) (11 36 10 36 7) (10 36 10 37 7) (10 37 9 38 7) (9 38 8 39 7) (8 39 7 39 7) (7 39 10 39 7) (10 39 10 38 7) (10 38 11 37 7) (11 37 12 36 7) (12 36 12 35 7) (12 35 12 34 7) (12 34 13 31 7) (13 31 13 30 7) (13 30 13 29 7) (13 29 13 27 7) (13 27 13 21 7) (13 21 13 20 7) (13 20 13 19 7) (13 19 13 17 7) (13 17 13 16 7) (13 16 12 14 7) (12 14 12 13 7) (12 13 11 11 7) (11 11 11 10 7) (11 10 10 10 7) (7 9 6 9 7) (6 9 5 10 7) (5 10 4 11 7) (4 11 3 12 7) (3 12 3 13 7) (3 13 3 14 7) (3 14 2 15 7) (2 15 2 16 7) (2 16 2 17 7) (2 17 2 19 7) (2 19 2 20 7) (2 20 2 22 7) (2 22 2 23 7) (2 23 2 24 7) (2 24 3 25 7) (3 25 3 26 7) (3 26 3 27 7) (3 27 3 28 7) (3 28 4 29 7) (4 29 7 29 7) (7 29 6 29 7) (6 29 5 29 7) (5 29 5 28 7) (5 28 4 27 7) (4 27 4 26 7) (4 26 3 24 7) (3 24 3 23 7) (3 23 3 21 7) (3 21 3 20 7) (3 20 3 19 7) (3 19 3 17 7) (3 17 3 16 7) (3 16 3 15 7) (3 15 4 14 7) (4 14 4 13 7) (4 13 5 12 7) (5 12 5 11 7) (5 11 6 11 7) (6 11 7 10 7) (7 10 10 10 7) (10 10 10 9 7) (10 9 9 9 7) (9 9 8 9 7) (8 9 7 9 7) (24 9 13 9 7) (13 9 13 20 7) (13 20 16 20 7) (16 20 13 31 7) (13 31 14 30 7) (14 30 17 18 7) (17 18 14 18 7) (14 18 14 11 7) (14 11 23 11 7) (23 11 24 9 7) (24 9 23 11 7) (23 11 20 22 7) (20 22 23 22 7) (23 22 23 30 7) (23 30 14 30 7) (14 30 13 31 7) (13 31 24 31 7) (24 31 24 21 7) (24 21 21 21 7) (21 21 24 9 7) (29 22 28 24 7) (28 24 28 30 7) (28 30 25 30 7) (25 30 29 31 7) (29 31 29 24 7) (29 24 29 22 7) (29 22 29 24 7) (29 24 29 31 7) (29 31 30 30 7) (30 30 30 24 7) (30 24 30 22 7) (30 22 29 22 7) (29 9 29 15 7) (29 15 29 16 7) (29 16 30 17 7) (30 17 30 15 7) (30 15 30 11 7) (30 11 33 11 7) (33 11 29 9 7) (29 9 28 11 7) (28 11 28 15 7) (28 15 29 17 7) (29 17 30 17 7) (30 17 29 16 7) (29 16 29 15 7) (29 15 29 9 7) (34 9 29 9 7) (29 9 33 11 7) (33 11 33 15 7) (33 15 33 17 7) (33 17 33 18 7) (33 18 33 19 7) (33 19 32 20 7) (32 20 33 20 7) (33 20 33 21 7) (33 21 33 22 7) (33 22 33 23 7) (33 23 33 24 7) (33 24 33 30 7) (33 30 30 30 7) (30 30 29 31 7) (29 31 34 31 7) (34 31 34 24 7) (34 24 34 23 7) (34 23 34 22 7) (34 22 34 21 7) (34 21 34 19 7) (34 19 34 18 7) (34 18 34 16 7) (34 16 34 15 7) (34 15 34 9 7) (29 9 24 9 7) (24 9 24 14 7) (24 14 24 15 7) (24 15 24 16 7) (24 16 24 18 7) (24 18 25 19 7) (25 19 25 20 7) (25 20 25 21 7) (25 21 24 22 7) (24 22 24 23 7) (24 23 24 25 7) (24 25 24 31 7) (24 31 29 31 7) (29 31 25 30 7) (25 30 25 25 7) (25 25 25 24 7) (25 24 25 23 7) (25 23 25 22 7) (25 22 26 21 7) (26 21 26 20 7) (26 20 26 19 7) (26 19 26 18 7) (26 18 25 18 7) (25 18 25 17 7) (25 17 25 16 7) (25 16 25 14 7) (25 14 25 11 7) (25 11 28 11 7) (28 11 29 9 7) (40 2 35 2 7) (35 2 35 31 7) (35 31 36 30 7) (36 30 36 3 7) (36 3 39 3 7) (39 3 40 2 7) (40 2 39 3 7) (39 3 39 30 7) (39 30 36 30 7) (36 30 35 31 7) (35 31 40 31 7) (40 31 40 2 7)))
  (setq dcl_id (load_dialog (setq Dcl_File (Write_Dcl_addgc))))
  (vl-file-delete Dcl_File)
  (setq Dialog_Return 2)
  (while (> Dialog_Return 1)
    (new_dialog "addgc" dcl_id)
    (setq keys '("dataOp" "gc2Op" "dgxOp" "gconeOp" "gcjlOp" "gcjl" "accept" "cancel" "writerImage"))
    (start_image "writerImage")
    (fill_image 0 0 (dimx_tile "writerImage") (dimy_tile "writerImage") 1)
    (mapcar 'eval (mapcar 'cons (mapcar '(lambda (x) 'vector_image) writerImage) writerImage))
    (end_image)
    (foreach key keys (action_tile key "(Action_addgc_Keys $key $value)"))
    (mode_tile "gcjl" 1)
    (setq Dialog_Return (start_dialog))
    (cond
      ((= Dialog_Return 3)
         (sratAddgc dataOp gc2Op dgxOp gconeOp gcjlOp gcjl)
         (unload_dialog dcl_id)
      )
    )
  )
  (unload_dialog dcl_id)
  (princ)
)
;;;参数 dataOp数据文件 gc2Op两端点高程 dgxOp两条等高线 gconeOp单个高程点 gcjlOp以距离间隔 gcjl距离
(defun sratAddgc (dataOp gc2Op dgxOp gconeOp gcjlOp gcjl / acaddocument acadobject ang coord dgxobj dis ent i infolst inserd ist1 ist2 k l mspace n name num pl pt pt1 pt1x pt1y pt1z pt2 ptlst s scale sjwlst ss tag txt txth use x xsws y z zpt)
  ;;;获取高程点的信息
  (setq AcadObject   (vlax-get-acad-object)
        AcadDocument (vla-get-ActiveDocument AcadObject)
        mSpace       (vla-get-ModelSpace AcadDocument)
  )
  (cond
    ((= dataOp "1") ;数据文件生成高程点
      (progn
        (if (setq i 0 s (ssget '((8 . "GCD") (0 . "INSERT") (2 . "GC200"))))
          (progn
            (repeat (sslength s)
              (setq pl (cons (cdr (assoc 10 (entget (ssname s i)))) pl)
                    i  (1+ i)
              )
            )
            ;;;高程点信息(list Scale inserD Tag txt ist1 txth ist2 xsws)
            (setq infolst (getgcinfo (ssname s 0)))
            (setq Scale  (car infolst)
                  inserD (cadr infolst)
                  Tag    (caddr infolst)
                  txt    (cadddr infolst)
                  ist1   (cadddr (reverse infolst))
                  txth   (caddr (reverse infolst))
                  ist2   (cadr (reverse infolst))
                  xsws   (car (reverse infolst))
            )
            ;;;建立三角网
            (setq sjwlst (addgcsjw pl))
            (cond
              ((= gconeOp "1") ;单个高程点
                (progn
                  (while (setq pt (getpoint "\n内插高程点"))
                    (setq pt (list (car pt) (cadr pt)))
                    ;;角度法判断点在那个三角形 返回((ptx pty ptz) ((p1x p1y p1z) (p2x p2y p2z) (p3x p3y p3z)))
                    (setq ptlst (addgcptinpm pt sjwlst))
                    (if ptlst ;如果点在三角形线上或三角形内
                      (progn
                        ;;双线性内插计算内插点的高程值 返回内插点(x y z)
                        (setq zpt (zInsert ptlst))
                        ;(Entmakegcd 插入点 高程 图块比例 属性 文字字符 文字插入点 小数位数)
                        (Entmakegcd zpt (caddr zpt) Scale inserD Tag txt ist1 txth ist2 xsws)
                      )
                    )
                  )
                )
              )
              ((= gcjlOp "1") ;以距离间隔
                (progn
                  (while
                    (and (setq pt1 (getpoint "\n选择第一点"))
                         (setq pt2 (getpoint "\n选择第二点"))
                    )
                    (setq dis (distance pt1 pt2)
                          ang (angle pt1 pt2)
                          num (atoi (rtos (/ dis gcjl) 2 0)) ;循环次数
                          n   0
                    )
                    (repeat num
                      (setq pt (polar pt1 ang (* n gcjl)))
                      (setq pt (list (car pt) (cadr pt)))
                      (setq ptlst (addgcptinpm pt sjwlst))
                      (if ptlst
                        (progn
                           (setq zpt (zInsert ptlst))
                           (Entmakegcd zpt (caddr zpt) Scale inserD Tag txt ist1 txth ist2 xsws)
                        )
                      )
                      (setq n (1+ n))
                    )
                    (setq pt (list (car pt2) (cadr pt2)))
                    (setq ptlst (addgcptinpm pt sjwlst))
                    (if ptlst
                      (progn
                        (setq zpt (zInsert ptlst))
                        (Entmakegcd zpt (caddr zpt) Scale inserD Tag txt ist1 txth ist2 xsws)
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
    ((= gc2Op "1") ;两端点高程内插高程点
       (progn
          (setvar "OSMODE" 4)
          (while
            (and (setq pt1 (getpoint "\n选择第一点高程"))
                 (setq pt2 (getpoint "\n选择第二点高程"))
            )
            (setq pt1x (car pt1))
            (setq pt1y (cadr pt1))
            (setq pt1z (caddr pt1))
            (setq s (ssget "X" (list '(-4 . "=,=,=") (list 10 pt1x pt1y pt1z) '(-4 . "<OR") '(8 . "GCD") '(-4 . "OR>") '(-4 . "<OR") '(0 . "INSERT") '(-4 . "OR>"))))
            (setq infolst (getgcinfo (ssname s 0)))
            (setq Scale  (car infolst)
                  inserD (cadr infolst)
                  Tag    (caddr infolst)
                  txt    (cadddr infolst)
                  ist1   (cadddr (reverse infolst))
                  txth   (caddr (reverse infolst))
                  ist2   (cadr (reverse infolst))
                  xsws   (car (reverse infolst))
            )
            (setq dis (/ (distance (list (car pt1) (cadr pt1)) (list (car pt2) (cadr pt2))) 2))
            (setq ang (angle (list (car pt1) (cadr pt1)) (list (car pt2) (cadr pt2))))
            (setq pt (polar (list (car pt1) (cadr pt1)) ang dis))
            (setq z (+ (caddr pt1) (/ (* (- (caddr pt2) (caddr pt1)) (- (car pt) (car pt1))) (- (car pt2) (car pt1)))))
            (setq zpt (list (car pt) (cadr pt) z))
            (Entmakegcd zpt (caddr zpt) Scale inserD Tag txt ist1 txth ist2 xsws)
          )
          (setvar "OSMODE" 0)
       )
    )
    ((= dgxOp "1") ;图面等高线内插高程点
       (progn
         (if (= (getvar "USERR1") 0.0)
           (progn
             (setq USE (getint "\n绘图比例1:<10000>"))
             (if (= USE nil) (setq USE 10000))
             (setvar "USERR1" USE)
           )
         )
         (setq USE   (getvar "USERR1")
               scale (* USE 0.001)
         )
         (prompt "\n===请选择图层名为DGX或DSX的Polyline线===")
         (setq ss (ssget '((0 . "POLYLINE") (8 . "DSX,DGX"))))
         (if ss
           (progn
             (setq k -1)
             (setq pl '())
             (repeat (sslength ss)
               (setq Name   (ssname ss (setq k (1+ k)))
                     ent    (entget Name)
                     z      (cadddr (assoc 10 ent))
                     dgxObj (vlax-ename->vla-object Name)
                     coord  (vlax-get dgxObj 'Coordinates )
                     i      0
                     L      (length coord)
               )
               (repeat (/ L 3)
                 (setq x (nth (* i 1) coord))
                 (setq y (nth (1+ (* i 1)) coord))
                 (setq pl (cons (list x y z) pl))
                 (setq i (+ i 3))
               )
             )
             (setq sjwlst (addgcsjw pl))
             (cond
              ((= gconeOp "1") ;单个高程点
                (progn
                  (while (setq pt (getpoint "\n内插高程点"))
                    (setq pt (list (car pt) (cadr pt)))
                    (setq ptlst (addgcptinpm pt sjwlst))
                    (if ptlst
                      (progn
                        (setq zpt (zInsert ptlst))
                        (gxl-cs:gcd zpt (caddr zpt) scale 2)
                      )
                    )
                  )
                )
               )
               ((= gcjlOp "1") ;以距离间隔
                (progn
                  (while
                    (and (setq pt1 (getpoint "\n选择第一点"))
                         (setq pt2 (getpoint "\n选择第二点"))
                    )
                    (setq dis (distance pt1 pt2)
                          ang (angle pt1 pt2)
                          num (atoi (rtos (/ dis gcjl) 2 0)) ;循环次数
                          n   0
                    )
                    (repeat num
                      (setq pt (polar pt1 ang (* n gcjl)))
                      (setq pt (list (car pt) (cadr pt)))
                      (setq ptlst (addgcptinpm pt sjwlst))
                      (if ptlst
                        (progn
                           (setq zpt (zInsert ptlst))
                           (gxl-cs:gcd zpt (caddr zpt) scale 2)
                        )
                      )
                      (setq n (1+ n))
                    )
                    (setq pt (list (car pt2) (cadr pt2)))
                    (setq ptlst (addgcptinpm pt sjwlst))
                    (if ptlst
                      (progn
                        (setq zpt (zInsert ptlst))
                        (gxl-cs:gcd zpt (caddr zpt) scale 2)
                      )
                    )
                  )
                )
              )
             )             
           )
         )
       )
    )
  )
)
(defun addgcDXF (code elist) (cdr (assoc code elist)))
(defun MakeObject (obj)
  (cond
    ((= (type obj) 'VLA-OBJECT) obj)
    ((= (type obj) 'ENAME) (vlax-ename->vla-object obj))
  )
)
(defun VarArray->List (vaobj)
  (vlax-safearray->list (vlax-variant-value vaobj))
)
(defun getgcinfo (obj / attlist attobj idx inserd ist1 ist2 scale tag txt txth xsws)
  (if (and (= (addgcDXF 0 (entget obj)) "INSERT") (setq obj (MakeObject obj)))
    (if (= (vla-get-HasAttributes obj) :vlax-true)
      (progn
        (setq attlist (varArray->List (vla-GetAttributes obj))
              Scale   (vla-get-XScaleFactor obj)
              inserD  (vlax-safearray->list (vlax-variant-value (vla-get-InsertionPoint obj))) ;点(块)的坐标值
              idx     0
        )
        (repeat (length attlist)
          (setq attobj (nth idx attlist)
                Tag   (append Tag   (list (vla-get-TagString attobj)))
                txt   (append txt   (list (vla-get-TextString attobj))) ;(高程值字符)
                ist1  (append ist1 (list (vlax-safearray->list (vlax-variant-value (vla-get-TextAlignmentPoint attobj)))))
                txth  (append txth  (list (vla-get-Height attobj))) ;高程值字符高度
                ist2  (append ist2 (list (vlax-safearray->list (vlax-variant-value (vla-get-InsertionPoint attobj)))))
                idx   (1+ idx)
          )
        )
        (cond
          ((= (car Tag) "height")
            (setq xsws (strlen (substr (car txt) (+ 4 (vl-string-search "." (car txt))))))
          )
          ((= (car Tag) "integer")
            (setq xsws (strlen (cadr txt)))
          )
        )
        (list Scale inserD Tag txt ist1 txth ist2 xsws)
      )
    )
  )
)
(defun addgcsjw (pl / a al b bb c cp el L ma mi p r sl tl tr x1 x2 y1 y2)
  (if pl
    (progn
      (setq pl (vl-sort pl (function (lambda (a b) (< (car a) (car b)))))
            bb (list (apply 'mapcar (cons 'min pl)) (apply 'mapcar (cons 'max pl)))
            x1 (caar bb)
            x2 (caadr bb)
            y1 (cadar bb)
            y2 (cadadr bb)
      )
      (setq cp (list (/ (+ x1 x2) 2.0) (/ (+ y1 y2) 2.0))
            r (* (distance cp (list x1 y1)) 20)
            ma (+ (car cp) r)
            mi (- (car cp) r)
            sl (list (list ma (cadr cp) 0) (list mi (+ (cadr cp) r) 0) (list mi (- (cadr cp) r) 0))
            al (list (cons x2 (cons cp (cons (* 20 r) sl))))
            ma (1- ma)
            mi (1+ mi)
      )
      (repeat (length pl)
        (setq p  (car pl)
              pl (cdr pl)
              el nil
        ) 
        (while al
          (setq tr  (car al)
                al  (cdr al)
          ) 
          (cond
            ((< (car tr) (car p)) (setq tl (cons (cdddr tr) tl)))
            ((< (distance p (cadr tr)) (caddr tr))
                (setq
                   tr (cdddr tr)
                   a  (car tr)
                   b  (cadr tr)
                   c  (caddr tr)
                   el (cons (list (+ (car a) (car b)) (+ (cadr a) (cadr b)) a b)
                            (cons (list (+ (car b) (car c)) (+ (cadr b) (cadr c)) b c)
                                  (cons (list (+ (car c) (car a)) (+ (cadr c) (cadr a)) c a) el)
                            )
                      )
                )
            )
            (t (setq L (cons tr L)))
          )
        )
        (setq al L
              L nil
              el (vl-sort el (function (lambda (a b) (if (= (car a) (car b)) (<= (cadr a) (cadr b)) (< (car a) (car b))))))
        )
        (while el
          (if (and (= (caar el) (caadr el)) (= (cadar el) (cadadr el)))
              (setq el (cddr el))
              (setq al (cons (addgcgetcir p (cddar el)) al)
                    el (cdr el)
              )
          ) 
        )
      )
      (foreach tr al (setq tl (cons (cdddr tr) tl)))
      (setq tl (vl-remove-if-not (function (lambda (a) (and (< mi (caadr a) ma) (< mi (caaddr a) ma)))) tl))
    )
  )
)
(defun addgcgetcir (p el / ang b c c2 cp r)
  (setq b (car el)
        c (cadr el)
        c2 (list (car c) (cadr c))
  )
  (if (not (zerop (setq ang (- (angle b c) (angle b p)))))
    (progn
      (setq cp (polar c2 (+ -1.570796326794896 (angle c p) ang) (setq r (/ (distance p c2) (sin ang) 2.0)))
            r (abs r)
      )
      (list (+ (car cp) r) cp r p b c)
    )
  )
)
(defun addgcptinpm (pt lst / an anl i L n p1 p2 plst ret vlst)
  (setq n 0 L (length lst))
  (while (< n L)
    (setq vlst (car lst))
    (setq i -1
          p1 (last vlst)
    )
    (while (and (not ret) (setq p2 (nth (setq i (1+ i)) vlst)))
      (cond
        ((equal p2 pt 1e-4) (setq ret t))
        (t
          (setq an (- (angle pt p1) (angle pt p2)))
          (if (equal pi (abs an) 1e-4)
            (setq ret t)
            (setq anl (cons (rem an pi) anl))
          )
        )
      )
      (setq p1 p2)
    )
    (cond
      (ret (setq plst (list pt vlst))) ;线上;
      (t
        (if (equal pi (abs (apply '+ anl)) 1e-4)
          (setq plst (list pt vlst)) ;三角网内
          nil ;外
        )
      )
    )
    (setq n (1+ n))
    (setq lst (cdr lst))
    (if plst (setq n L))
  )
  plst
)
;;双线性内插计算内插高程值
(defun zInsert (ptl / L pt0 pt0x pt0y pt1 pt2 pta ptb ptc ptz r xa xb xc ya yb yc za zb zc zl zr)
  (setq pt0  (car ptl)
        pt0X (car pt0)
        pt0Y (cadr pt0)
        pt1  (polar (list pt0X pt0Y) 0 1000)
        pt2  (polar (list pt0X pt0Y) pi 1000)
        ptA  (car (cadr ptl))
        Xa (car ptA)
        Ya (cadr ptA)
        Za (caddr ptA)
        ptB  (cadr (cadr ptl))
        Xb (car ptB)
        Yb (cadr ptB)
        Zb (caddr ptB)
        ptC  (caddr (cadr ptl))
        Xc (car ptC)
        Yc (cadr ptC)
        Zc (caddr ptC)
  )
  ;求交点
  (setq L (inters pt1 pt2 (list Xa Ya) (list Xb Yb)))
  (cond
    ((/= L nil)
      (setq zL (+ Za (/ (* (- Zb Za) (- (car L) Xa)) (- Xb Xa))))
    )
    ((= L nil)
      (progn
         (setq L (inters pt1 pt2 (list Xb Yb) (list Xc Yc)))
         (setq zL (+ Zb (/ (* (- Zc Zb) (- (car L) Xb)) (- Xc Xb))))
      )
    )
  )
  (setq R (inters pt1 pt2 (list Xa Ya) (list Xc Yc)))
  (cond
    ((/= R nil)
      (setq zr (+ Za (/ (* (- Zc Za) (- (car R) Xa)) (- Xc Xa))))
    )
    ((= R nil)
      (progn
        (setq R (inters pt1 pt2 (list Xb Yb) (list Xc Yc)))
        (setq zr (+ Zb (/ (* (- Zc Zb) (- (car R) Xb)) (- Xc Xb))))
      )
    )
  )
  (setq ptZ (+ zL (/ (* (- zr zL) (- pt0X (car L))) (- (car R) (car L)))))
  (list pt0X pt0Y ptZ)
)
;;;创建Cass高程点
(defun Entmakegcd (inspt height scale inserD tag txt ist1 txth ist2 xsws / blkdef d1 d2 d3 d4 obj pt pt1 pt2 pt3 pt4 str1 str2)
  (setvar "CMDECHO" 0)
  (command "layer" "m" "GCD" "c" "1" "" "L" "CONTINUOUS" ""  "")
  (if height
    (setq height (rtos height 2 xsws))
    (setq height "")
  )
  (regapp "SOUTH")
  ;;;检查字体 "HZ" 是否存在
  (if (not (tblobjname "style" "HZ"))
    (command "style" "HZ" "rs.shx,hztxt.shx" 0 1 0 "" "" "")
  )
  ;;;检查是否存在高程点图块定义
  (if (not (tblobjname "block" "GC200"))
    (progn
      (setq blkdef (vla-Add (vla-get-Blocks (vla-get-ActiveDocument (vlax-get-acad-object))) (vlax-3D-point '(0 0 0)) "GC200"))
      (setq obj
        (vla-AddPolyline
           blkdef
           (vlax-make-variant
              (vlax-safearray-fill
                 (vlax-make-safearray vlax-vbdouble (cons 0 5))
                 '(-0.2 0 0 0.2 0 0)
              )
           )
        )
      )
      (vla-SetBulge obj 0 1) (vla-SetBulge obj 1 1)
      (vla-put-Closed obj :vlax-true)
      (vla-put-ConstantWidth obj 0.4)
    )
  )
  (cond
    ((= (car tag) "height")
      ;;;插入高程点
      (entmake (list '(0 . "INSERT") '(100 . "AcDbEntity") '(100 . "AcDbBlockReference") '(66 . 1) (cons 2 "GC200") (cons 10 inspt) (cons 41 scale) (cons 42 scale) (cons 43 scale) '(-3 ("SOUTH" (1000 . "202101")))))
      (entmake (list '(0 . "ATTRIB") '(100 . "AcDbEntity") '(100 . "AcDbText") (cons 10 (setq pt (polar inspt 0 (* 1.2 scale)))) (cons 40 (* 2.0 scale)) (cons 50 0) (cons 41 0.8) (cons 51 0) (cons 1 height) (cons 7 "HZ") (cons 72 0) (cons 11 pt) '(100 . "AcDbAttribute") (cons 2 "height") (cons 70  0) (cons 74 2)))
    )
    ((= (car tag) "integer")
      ;;;插入水深点
      (progn
        (setq d1 (distance (list (car (car ist1)) (cadr (car ist1))) (list (car inserD) (cadr inserD))))
        (setq d2 (distance (list (car (car ist2)) (cadr (car ist2))) (list (car inserD) (cadr inserD))))
        (setq d3 (distance (list (car (cadr ist1)) (cadr (cadr ist1))) (list (car inserD) (cadr inserD))))
        (setq d4 (distance (list (car (cadr ist2)) (cadr (cadr ist2))) (list (car inserD) (cadr inserD))))
        (setq pt1 (polar inspt (angle (list (car inserD) (cadr inserD)) (list (car (car ist1)) (cadr (car ist1)))) d1))
        (setq pt2 (polar inspt (angle (list (car inserD) (cadr inserD)) (list (car (car ist2)) (cadr (car ist2)))) d2))
        (setq pt3 (polar inspt (angle (list (car inserD) (cadr inserD)) (list (car (cadr ist1)) (cadr (cadr ist1)))) d3))
        (setq pt4 (polar inspt (angle (list (car inserD) (cadr inserD)) (list (car (cadr ist2)) (cadr (cadr ist2)))) d4))
        (setq str1 (substr height 1 (vl-string-search "." height)))
        (setq str2 (substr height (+ 2 (vl-string-search "." height))))
        (entmake (list '(0 . "INSERT") '(100 . "AcDbEntity") '(100 . "AcDbBlockReference") '(66 . 1) (cons 2 "GC200") (cons 10 inspt) (cons 41 scale) (cons 42 scale) (cons 43 scale) '(-3 ("SOUTH" (1000 . "186400")))))
        (entmake (list '(0 . "ATTRIB") '(100 . "AcDbEntity") '(100 . "AcDbText") (cons 10 pt2) (cons 40 (car txth)) (cons 1 str1) (cons 2 "integer") (cons 70 2) (cons 50 0) (cons 41 0.8) (cons 51 0) (cons 7 "HZ") (cons 71 0) (cons 72 2) (cons 74 1) (cons 11 pt1) '(-3 ("SOUTH" (1000 . "186411")))))
        (entmake (list '(0 . "ATTRIB") '(100 . "AcDbEntity") '(100 . "AcDbText") (cons 10 pt4) (cons 40 (car txth)) (cons 1 str2) (cons 2 "decimal") (cons 70 2) (cons 50 0) (cons 41 0.8) (cons 51 0) (cons 7 "HZ") (cons 71 0) (cons 72 0) (cons 74 1) (cons 11 pt3) '(-3 ("SOUTH" (1000 . "186412")))))
      )
    )
  )
  ;;;结束标志
  (entmake '((0 . "SEQEND")))
  (princ)
)
;;;by Gu_xl
(defun gxl-cs:gcd (inspt height scale xsws / pt blkdef obj)
  (setvar "CMDECHO" 0)
  (command "layer" "m" "GCD" "c" "1" "" "L" "CONTINUOUS" ""  "")
  (if height
    (setq height (rtos height 2 xsws))
    (setq height "")
  )
  (regapp "SOUTH")
  ;;;检查字体 "HZ" 是否存在
  (if (not (tblobjname "style" "HZ"))
    (command "style" "HZ" "rs.shx,hztxt.shx" 0 1 0 "" "" "")
  )
  ;;;检查是否存在高程点图块定义
  (if (not (tblobjname "block" "GC200"))
    (progn
      (setq blkdef (vla-Add (vla-get-Blocks (vla-get-ActiveDocument (vlax-get-acad-object))) (vlax-3D-point '(0 0 0)) "GC200"))
      (setq obj
        (vla-AddPolyline
           blkdef
           (vlax-make-variant
              (vlax-safearray-fill
                 (vlax-make-safearray vlax-vbdouble (cons 0 5))
                 '(-0.2 0 0 0.2 0 0)
              )
           )
        )
      )
      (vla-SetBulge obj 0 1) (vla-SetBulge obj 1 1)
      (vla-put-Closed obj :vlax-true)
      (vla-put-ConstantWidth obj 0.4)
    )
  )
  ;;;插入块
  (entmake (list
             '(0 . "INSERT")
             '(100 . "AcDbEntity")
             '(100 . "AcDbBlockReference")
             '(66 . 1);;;属性跟随标志,1跟随，0不跟随
              (cons 2 "GC200")
              (cons 10 inspt)
              (cons 41 scale)
              (cons 42 scale)
              (cons 43 scale)
              '(-3 ("SOUTH" (1000 . "202101")))
           )
  )
  ;;;插入属性
  (entmake (list
             '(0 . "ATTRIB")
             '(100 . "AcDbEntity")
             '(100 . "AcDbText")
              (cons 10 (setq pt (polar inspt 0 (* 1.2 scale))))
              (cons 40 (* 2.0 scale))
              (cons 50 0)
              (cons 41 0.8)
              (cons 51 0)
              (cons 1 height)
              (cons 7 "HZ")
              (cons 72 0)
              (cons 11 pt)
              '(100 . "AcDbAttribute")
              (cons 2 "height")
              (cons 70  0)
              (cons 74 2)
           )
   )
   ;;;结束标志
   (entmake '((0 . "SEQEND")))
   (princ)
)
(defun Action_addgc_Keys (key Value)
  (cond
    ((= key "accept")
      (setq dataOp (get_tile "dataOp") gc2Op (get_tile "gc2Op") dgxOp (get_tile "dgxOp") gconeOp (get_tile "gconeOp")
            gcjlOp (get_tile "gcjlOp") gcjl (atof (get_tile "gcjl"))
      )
      (done_dialog 3)
    )
    ((= key "gconeOp") (mode_tile "gcjl" 1))
    ((= key "gcjlOp") (mode_tile "gcjl" 0))
    ((= key "gc2Op") (mode_tile "gcjl" 1) (mode_tile "gcjlOp" 1))
    ((= key "dataOp") (mode_tile "gcjlOp" 0))
    ((= key "dgxOp") (mode_tile "gcjlOp" 0))
    ((= key "cancel") (done_dialog 0))
  )
)
(defun Write_Dcl_addgc ( / Dcl_File file str)
  (setq Dcl_File (vl-filename-mktemp nil nil ".Dcl"))
  (setq file (open Dcl_File "w"))
  (foreach str '(
    "addgc:dialog"
    "{"
    " label = \"高程点内插程序\";"
    "    :row"
    "    {"
    "        :boxed_column"
    "        {"
    "         label = \"高程参考\" ;"
    "            :radio_button"
    "            {"
    "                key = \"dataOp\" ;"
    "                label = \"图面高程点\" ;"
    "                width = 10.95 ;"
    "                height = 1.275 ;"
    "                value = \"1\" ;"
    "            }"
    "            :radio_button"
    "            {"
    "                key = \"gc2Op\" ;"
    "                label = \"两端点高程\" ;"
    "                width = 12.15 ;"
    "                height = 1.275 ;"
    "            }"
    "            :radio_button"
    "            {"
    "                key = \"dgxOp\" ;"
    "                label = \"图面等高线\" ;"
    "                width = 12.15 ;"
    "                height = 1.275 ;"
    "            }"
    "        }"
    "        :boxed_column"
    "        {"
    "         label = \"生成方式\" ;"
    "            :radio_button"
    "            {"
    "                key = \"gconeOp\" ;"
    "                label = \"逐个内插\" ;"
    "                width = 10.15 ;"
    "                height = 1.275 ;"
    "                value = \"1\" ;"
    "                fixed_width = true ;"
    "            }"
    "            :radio_button"
    "            {"
    "                key = \"gcjlOp\" ;"
    "                label = \"线状内插\" ;"
    "                width = 10.15 ;"
    "                height = 1.275 ;"
    "                fixed_width = true ;"
    "            }"
    "            :edit_box"
    "            {"
    "                key = \"gcjl\" ;"
    "                label = \"m=\" ;"
    "                width = 1.15 ;"
    "                height = 0.675 ;"
    "                value = \"5\" ;"
    "                fixed_width = true ;"
    "            }"
    "        }"
    "    }"
    "    :row"
    "    {"
    "       :button"
    "       {"
    "          key = \"accept\" ;"
    "          label = \"确定\" ;"
    "          width = 3.15 ;"
    "          height = 2.275 ;"
    "          is_default = true;"
    "       }"
    "       :button"
    "       {"
    "          key = \"cancel\" ;"
    "          label = \"取消\" ;"
    "          width = 3.15 ;"
    "          height = 2.275 ;"
    "          is_cancel = true;"
    "       }"
    "       :image"
    "       {"
    "          key = \"writerImage\" ;"
    "          width = 2.25 ;"
    "          height = 3.275 ;"
    "       }"
    "    }"
    "}"
    )
    (write-line str file)
  )
  (close file)
  Dcl_File
)