using ppmcc

function main()
    temperature = [15, 16, 18, 22, 14, 25, 17, 28, 30, 26]
    days = [21, 20, 18, 16, 24, 15, 18, 14, 12, 14]

    r, (a, b), estimated_time = analyze_concrete_data(temperature, days)

    println("Pearson's correlation coefficient r = ", round(r, digits=4))
    println("Regression equation: Time = $(round(a, digits=2)) + ($(round(b, digits=2)) * Temperature)")
    println("Estimated drying time for 23°C: $(round(estimated_time, digits=2)) days")
end

main()
