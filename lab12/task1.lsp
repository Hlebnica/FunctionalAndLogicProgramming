(defun mass-beheading (&rest list-of-lists)
  (if (null list-of-lists)
      '()  ; Если список аргументов пуст, возврат пустого списка
      (cons (caar list-of-lists)  ; Добавлением головы первого аргумента (списка)
            (apply #'mass-beheading (cdr list-of-lists)))))  ; Рекурсивная обработка остальных аргументов

(format t "Выходные данные: ~a~%" (mass-beheading '(1 2 3) '(4 5 6) '(7 8 9)))
