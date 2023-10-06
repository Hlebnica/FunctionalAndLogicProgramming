(defun mass-beheading (lists)
  (if (null lists)
      '() ; Если список списков пуст, возвращаем пустой список.
      (cons (car (car lists)) ; Берем голову первого списка и добавляем в результат.
            (mass-beheading (cdr lists))))) ; Рекурсивно вызываем функцию для оставшихся списков.

; Пример использования:
(setq input-lists '((1 2 3) (4 5 6) (7 8 9)))
(format t "Входные данные: ~a~%" input-lists)
(format t "Выходные данные: ~a~%" (mass-beheading input-lists))
