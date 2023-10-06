(defun is-palindrome (number)
  ; Определение функции is-palindrome с параметром number
  (let ((num-str (format nil "~a" number)))
    ; Внутри функции используя let создается локальная переменная num-str, в которой помещается
    ; текстовое представление числа, полученное с помощью функции format и ~a

    (string= num-str (reverse num-str))))
    ; Сравниваем строку num-str с ее обратной версией, полученной с помощью функции reverse
    ; Если строки равны, то функция возвращает T, иначе NIL

(defun main ()
  (format t "Введите число: ")
  (let ((input (read)))
    (if (is-palindrome input)
        (format t "Число ~a - палиндром.~%" input)
        (format t "Число ~a - не палиндром.~%" input))))

(main)
