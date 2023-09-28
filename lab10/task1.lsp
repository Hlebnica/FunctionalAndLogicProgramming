(defun draw-square ()
  (format t "Введите размер квадрата: ~%")
  (setq size (read))
  (loop for i from 1 to size do
        (loop for j from 1 to size do
              (if (or (= i 1) (= i size) (= j 1) (= j size))
                  (format t "*")
                  (format t " ")))
        (format t "~%"))
  (format t "~%"))

(draw-square)