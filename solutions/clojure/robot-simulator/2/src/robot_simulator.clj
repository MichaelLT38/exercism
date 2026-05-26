(ns robot-simulator)

(defn robot [coordinates bearing]
  {:coordinates coordinates :bearing bearing})

(def turn-right
  {:north :east, :east :south,
   :south :west, :west :north})

(def turn-left
  {:north :west, :west :south,
   :south :east, :east :north})

(def advance
  {:north {:x 0 :y 1}
   :east  {:x 1 :y 0}
   :south {:x 0 :y -1}
   :west  {:x -1 :y 0}})

(defn command [robot command]
  (case command
    \R (update robot :bearing turn-right)
    \L (update robot :bearing turn-left)
    \A (let [{dx :x dy :y} (advance (:bearing robot))]
         (-> robot
             (update-in [:coordinates :x] + dx)
             (update-in [:coordinates :y] + dy)))))

(defn simulate [commands robot]
  (reduce command robot commands))
