(ns cars-assemble)

(defn production-rate [speed]
  (let [success (cond 
                  (= speed 0)  0.0
                  (<= speed 4) 1.0
                  (<= speed 8) 0.9
                  (= speed 9)  0.8
                  (= speed 10) 0.77
                  :else        0.0)]
    (* speed 221.0 success)))

(defn working-items [speed]
  (int (/ (production-rate speed) 60)))
