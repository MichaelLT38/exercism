(ns robot-simulator)

(defn robot [coordinates direction]
  {:bearing direction :coordinates coordinates})

(defn simulate [instructions robot-state]
  (reduce
   (fn [{:keys [bearing coordinates] :as r} i]
     (case i
       \R (assoc r :bearing ({:north :east :east :south :south :west :west :north} bearing))
       \L (assoc r :bearing ({:north :west :west :south :south :east :east :north} bearing))
       \A (let [{:keys [x y]} coordinates]
            (assoc r :coordinates
                   (case bearing
                     :north {:x x :y (inc y)}
                     :south {:x x :y (dec y)}
                     :east  {:x (inc x) :y y}
                     :west  {:x (dec x) :y y})))))
   robot-state instructions))
