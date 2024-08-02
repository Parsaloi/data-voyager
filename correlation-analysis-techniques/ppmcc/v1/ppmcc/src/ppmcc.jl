using Statistics

function analyze_concrete_data()
    # Data
    temperature = [15, 16, 18, 22, 14, 25, 17, 28, 30, 26]
    days = [21, 20, 18, 16, 24, 15, 18, 14, 12, 14]

    # (i) Compute Pearson's product moment correlation coefficient
    mean_temp = mean(temperature)
    mean_days = mean(days)

    numerator = sum((temperature .- mean_temp) .* (days .- mean_days))
    denominator = sqrt(sum((temperature .- mean_temp).^2) * sum((days .- mean_days).^2))

    r = numerator / denominator

    println("(i) Pearson's correlation coefficient r = ", round(r, digits=4))

    if r < -0.8
        println("There is a strong negative correlation between temperature and drying time.")
    elseif r < -0.5
        println("There is a moderate negative correlation between temperature and drying time.")
    elseif r < 0
        println("There is a weak negative correlation between temperature and drying time.")
    elseif r == 0
        println("There is no linear correlation between temperature and drying time.")
    elseif r <= 0.5
        println("There is a weak positive correlation between temperature and drying time.")
    elseif r <= 0.8
        println("There is a moderate positive correlation between temperature and drying time.")
    else
        println("There is a strong positive correlation between temperature and drying time.")
    end

    # (ii) Calculate the regression equation of time on temperature
    b = r * (std(days) / std(temperature))
    a = mean_days - b * mean_temp

    println("\n(ii) Regression equation:")
    println("Time = ", round(a, digits=2), " + (", round(b, digits=2), " * Temperature)")

    # (iii) Estimate drying time for temperature of 23°C
    estimated_time = a + b * 23

    println("\n(iii) Estimated drying time for 23°C:")
    println(round(estimated_time, digits=2), " days")
end

# Run the analysis
analyze_concrete_data()
