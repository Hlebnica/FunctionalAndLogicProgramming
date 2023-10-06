(defun my-intersection (&rest lists)
  (if (null lists)
      '()  ; Если список списков пуст, возврат пустого списока
      (let ((result (car lists)))  ; Инициализация результата первым списком
        (dolist (lst (cdr lists) result)  ; Проход по остальным спискам
          (setq result (remove-if-not (lambda (elem) (member elem lst :test #'equal)) result))))))  ; Исключение элементов, которых нет в текущем списке

(format t "Результат пересечения: ~a~%" (my-intersection '(1 2 3 6) '(2 3 5 6) '(3 4 6 7) '(3 0 6 3) '(3 2 6 1)))
