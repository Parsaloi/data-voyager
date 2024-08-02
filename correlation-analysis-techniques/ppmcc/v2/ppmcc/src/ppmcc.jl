module ppmcc

using Statistics

export analyze_concrete_data

function analyze_concrete_data(temperature, days)
    # Correlation coefficient calculation
    r = cor(temperature, days)

    # Regression equation
    b = r * (std(days) / std(temperature))
    a = mean(days) - b * mean(temperature)

    # Estimation for 23°C
    estimated_time = a + b * 23

    return (r, (a, b), estimated_time)
end

end # module ppmcc
