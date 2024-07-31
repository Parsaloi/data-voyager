import asyncio
import random
import matplotlib.pyplot as plt

async def generate_random_data(n, x_range=(0, 100), y_range=(0, 100)):
    return [(random.uniform(*x_range), random.uniform(*y_range)) for _ in range(n)]

async def calculate_least_squares(data):
    n = len(data)
    sum_x = sum(x for x, _ in data)
    sum_y = sum(y for _, y in data)
    sum_xy = sum(x * y for x, y in data)
    sum_x_squared = sum(x ** 2 for x, _ in data)

    b = (n * sum_xy - sum_x * sum_y) / (n * sum_x_squared - sum_x ** 2)
    a = (sum_y - b * sum_x) / n

    return a, b

async def plot_best_fitting_line(data, a, b):
    x_values, y_values = zip(*data)
    
    plt.figure(figsize=(10, 6))
    plt.scatter(x_values, y_values, color='blue', label='Data Points')
    
    x_line = [min(x_values), max(x_values)]
    y_line = [a + b * x for x in x_line]
    plt.plot(x_line, y_line, color='red', label=f'y = {a:.2f} + {b:.2f}x')
    
    plt.xlabel('X')
    plt.ylabel('Y')
    plt.title('Least Squares Regression Line')
    plt.legend()
    plt.grid(True)
    
    plt.savefig('least_squares_plot.png')
    plt.close()

async def async_main():
    # Generate random data
    data = await generate_random_data(20)
    print("Generated data:")
    for x, y in data:
        print(f"({x:.2f}, {y:.2f})")

    # Calculate least squares prediction line
    a, b = await calculate_least_squares(data)

    print(f"\nLeast squares prediction line: y = {a:.2f} + {b:.2f}x")

    # Plot the best-fitting line
    print("\nPlotting data points and best-fitting line...")
    await plot_best_fitting_line(data, a, b)
    print("Plot saved as 'least_squares_plot.png'")
