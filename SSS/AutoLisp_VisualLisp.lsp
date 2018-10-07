(defun c:csh () ; 初始化图层标注式 
(setvar 'cmdecho 0) 
(sztc1) 
(szbz1) 
(setvar 'cmdecho 1) 
) 

(defun c:ln () ; 设置选象图层前图层 
(setq e1 (entget (car (entsel "\n选择象：")))) 
; (entget (entlast)) 
(setq layer1 (assoc 8 e1)) 
(setq layername (cdr layer1)) 
(command "-layer" "s" layername "") 
(prin1 layername) 
) 

(defun c:lf () ; 关闭选象图层 
(setq e1 (entget (car (entsel "\n选择象：")))) 
; (entget (entlast)) 
(setq layer1 (assoc 8 e1)) 
(setq layername (cdr layer1)) 
(command "-layer" "off" layername "") 
(princ) 
) 

(defun c:lg () ; 关闭选象图层外其图层 
(setq e1 (entget (car (entsel "\n选择象其余图层关闭：")))) 
; 
(setq layer1 (assoc 8 e1)) 
(setq layername (cdr layer1)) 
(command "-layer" "off" "*" "y" "on" layername "s" layername "") 
(princ) 
) 
