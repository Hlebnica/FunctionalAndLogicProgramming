(defun nested-sum (lst)
  (cond
    ((null lst) 0)  ; Если список пуст, возврат 0
    ((atom lst) lst)  ; Если элемент атом, вернуть его значение
    (t (+ (nested-sum (car lst)) (nested-sum (cdr lst))))))  ; Иначе рекурсивно вычислить сумму головы и хвоста списка

(format t "Выходные данные: ~a~%" (nested-sum '(1 (2 ((3))) (4 5))
                                   ))
