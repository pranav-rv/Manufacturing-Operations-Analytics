# ============================================
# Manufacturing Operations - ETL Pipeline
# ============================================

import pandas as pd
import pyodbc

# ============================================
# 1. LOAD RAW DATA
# ============================================

input_file = "data/manufacturing_operations_synthetic_5000_12vars.xlsx"

df = pd.read_excel(input_file)

print("Raw dataset loaded successfully.")
print("Dataset shape:", df.shape)


# ============================================
# 2. DATA UNDERSTANDING
# ============================================

print("\n--- Dataset Information ---")
df.info()

print("\n--- First 5 Records ---")
print(df.head())


# ============================================
# 3. DATA QUALITY CHECKS
# ============================================

print("\n--- Missing Values ---")
print(df.isnull().sum())

print("\n--- Duplicate Rows ---")
print("Duplicate rows:", df.duplicated().sum())


# ============================================
# 4. NEGATIVE VALUE CHECK
# ============================================

numeric_columns = [
    "Planned_Units",
    "Produced_Units",
    "Defective_Units",
    "Downtime_Minutes",
    "Overtime_Hours",
    "Production_Cost"
]

print("\n--- Negative Value Check ---")
print(df[numeric_columns].lt(0).sum())


# ============================================
# 5. BUSINESS RULE VALIDATION
# ============================================

invalid_defects = df[
    df["Defective_Units"] > df["Produced_Units"]
]

print("\n--- Business Rule Check ---")
print(
    "Invalid defect records:",
    len(invalid_defects)
)


# ============================================
# 6. DATA TRANSFORMATION
# ============================================

df["Date"] = pd.to_datetime(df["Date"])

print("\nDate column converted to datetime.")


# ============================================
# 7. SAVE CLEANED DATA
# ============================================

output_file = "data/manufacturing_operations_cleaned.csv"

df.to_csv(output_file, index=False)

print("\nCleaned dataset saved successfully.")
print("Output file:", output_file)



print("Output file:", output_file)


# ============================================
# 8. CONNECT TO SQL SERVER
# ============================================

server = r"PK\SQLEXPRESS"
database = "Manufacturing_Operations_DB"

connection_string = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    f"SERVER={server};"
    f"DATABASE={database};"
    "Trusted_Connection=yes;"
)

conn = pyodbc.connect(connection_string)

print("\nSQL Server connection successful.")


# ============================================
# 9. LOAD CLEANED DATA INTO SQL SERVER
# ============================================

table_name = "Manufacturing_Operations"

# Clear existing data
cursor = conn.cursor()

cursor.execute("DELETE FROM dbo.Manufacturing_Operations")
conn.commit()

# Prepare INSERT query
columns = list(df.columns)

column_names = ", ".join(f"[{col}]" for col in columns)
placeholders = ", ".join("?" for _ in columns)

insert_query = f"""
INSERT INTO dbo.Manufacturing_Operations ({column_names})
VALUES ({placeholders})
"""

# Replace NaN with None
df_insert = df.where(pd.notnull(df), None)

# Convert DataFrame rows into tuples
data = [
    tuple(row)
    for row in df_insert.itertuples(index=False, name=None)
]

# Insert all rows
cursor.fast_executemany = True
cursor.executemany(insert_query, data)

conn.commit()

cursor.close()
conn.close()

print("\nCleaned data loaded into SQL Server successfully.")
print("Rows loaded:", len(df))


# ============================================
# ETL PROCESS COMPLETED
# ============================================

print("\n============================================")
print("ETL PROCESS COMPLETED SUCCESSFULLY")
print("============================================")
