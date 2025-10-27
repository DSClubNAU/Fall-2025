# Julia DataFrame Reshaping Activity
# Beginner Level - 20 Minutes

# Step 1: Import the DataFrames package
# type "]" (right bracket) in terminal to open package mode
# type "add DataFrames" to install the package 
# press backspace to exit package mode 

# import tha package
using DataFrames

# Step 2: Create a simple dataset
# Imagine this is sales data for different products across months
sales_data = DataFrame(
    Product = ["Laptop", "Mouse", "Keyboard", "Laptop", "Mouse", "Keyboard"],
    Month = ["January", "January", "January", "February", "February", "February"],
    Sales = [50, 200, 100, 55, 210, 95]
)

# Display the original data in long format
println("Original Data (Long Format):")
println(sales_data)

# Step 3: Reshape from Long to Wide Format
# unstack() makes it easier to compare products side-by-side
# Syntax: unstack(data, row_column, column_to_spread, value_column)
wide_data = unstack(sales_data, :Month, :Product, :Sales)

println("\n" * "="^50)
println("Wide Format (Products as Columns):")
println(wide_data)

# Step 4: Reshape back to Long Format
# stack() converts columns back into rows
# Syntax: stack(data, columns_to_stack)
long_data = stack(wide_data, [:Laptop, :Mouse, :Keyboard])
rename!(long_data, :variable => :Product, :value => :Sales)

println("\n" * "="^50)
println("Back to Long Format:")
println(long_data)

# =============================================================================
# YOUR TURN! Try creating your own dataset and reshaping it
# =============================================================================
# Instructions:
# 1. Create a DataFrame with columns: Student, Subject, Grade
# 2. Add at least 6 rows (2 students, 3 subjects each)
# 3. Use unstack() to create a wide format with subjects as columns
# 4. Use stack() to convert back to long format

# Example starter code:
my_data = DataFrame(
    Student = ["Alice", "Alice", "Alice", "Bob", "Bob", "Bob"],
    Subject = ["Math", "Science", "English", "Math", "Science", "English"],
    Grade = [85, 90, 88, 78, 82, 92]
)

wide_grades = unstack(my_data, :Student, :Subject, :Grade)
println(wide_grades) 

# =============================================================================
# BONUS: Working with Data - Aggregations and Calculations
# =============================================================================

# Calculate total sales per month using groupby() and combine()
monthly_totals = combine(groupby(sales_data, :Month), :Sales => sum => :TotalSales)
println("\n" * "="^50)
println("Total Sales per Month:")
println(monthly_totals)

# Calculate average sales per product
product_averages = combine(groupby(sales_data, :Product), :Sales => mean => :AvgSales)
println("\nAverage Sales per Product:")
println(product_averages)

# =============================================================================
# Key Functions Summary:
# - unstack(): Convert long format to wide format
# - stack(): Convert wide format to long format
# - groupby(): Group data by column values
# - combine(): Perform calculations on grouped data
# =============================================================================