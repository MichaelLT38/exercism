// ovenTime returns the amount in minutes that the lasagna should stay in the
// oven.
int ovenTime() {
    // TODO: Return the correct time.
    return 40;
}

/* remainingOvenTime returns the remaining
   minutes based on the actual minutes already in the oven.
*/
int remainingOvenTime(int actualMinutesInOven) {
    int remaining{0};
    remaining = ovenTime() - actualMinutesInOven;
    return remaining;
}

/* preparationTime returns an estimate of the preparation time based on the
   number of layers and the necessary time per layer.
*/
int preparationTime(int numberOfLayers) {
    int time{0};
    time = numberOfLayers * 2;
    return time;
}

// elapsedTime calculates the total time spent to create and bake the lasagna so
// far.
int elapsedTime(int numberOfLayers, int actualMinutesInOven) {
    int time{0};
    int LayersTotal{0};
    LayersTotal = numberOfLayers * 2;
    time = LayersTotal + actualMinutesInOven;
    return time;
}
