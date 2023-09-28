(defun estimate-pi (num-samples)
  (setq inside-circle 0) ; Переменная для подсчета точек внутри круга
  (loop for i from 1 to num-samples do ; Цикл для генерации случайных точек
        (setq x (- (random 1.0) 0.5)) ; Генерация случайных координат x в [-0.5, 0.5]
        (setq y (- (random 1.0) 0.5)) ; Генерация случайных координат y в [-0.5, 0.5]
        (if (< (+ (* x x) (* y y)) 0.25) ; Проверка, попадает ли точка внутрь круга
            (setq inside-circle (+ inside-circle 1)))) ; Если точка внутри круга, увеличить счетчик

  ; Вычисление pi
  (setq pi-estimate (/ (* 4.0 inside-circle) num-samples)) ; Оценка pi через отношение точек внутри круга ко всем точкам

  (format t "Оценка числа π методом Монте-Карло: ~a~%" pi-estimate)) ; Вывод оценки pi на экран

; Количество случайных точек для оценки
(setq num-samples 1000000)

; Вызов функции для оценки числа pi
(estimate-pi num-samples)
