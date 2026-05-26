local resistor_color = {}

local color_map = {
    black  = 0,
    brown  = 1,
    red    = 2,
    orange = 3,
    yellow = 4,
    green  = 5,
    blue   = 6,
    violet = 7,
    grey   = 8,
    white  = 9,
}

-- Returns the numeric code for a given color
function resistor_color.color_code(color)
    return color_map[color]
end

-- Returns the list of all colors in the correct order
function resistor_color.colors()
    return {
        'black',
        'brown',
        'red',
        'orange',
        'yellow',
        'green',
        'blue',
        'violet',
        'grey',
        'white'
    }
end

return resistor_color