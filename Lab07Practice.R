# Program 1
# Step 1: Create Vectors
Reg.No <- c("24BCE1001","24BCE1002","24BCE1003","24BCE1004","24BCE1005",
            "24BCE1006","24BCE1007","24BCE1008","24BCE1009","24BCE1010")
Name <- c("Aadesh Kumar","Bhavya Reddy","Charan Iyer","Divya Sharma","Esha Nair",
          "Farhan Khan","Gayathri Raj","Harish Kumar","Ishita Menon","Jai Verma")
Programme <- rep("B.Tech", 10)
Specialization <- c("CSE","AI","DS","IT","CSE","ECE","Cyber","AI","DS","IT")

Subject1 <- c(86,72,90,65,94,58,77,69,88,82)
Subject2 <- c(78,68,88,70,96,62,81,75,85,79)
Subject3 <- c(91,74,85,69,93,60,79,72,90,76)
Subject4 <- c(84,80,92,73,95,66,83,70,87,85)
Subject3_Marks <- Subject3   # explicit column per constraints

# Step 2: Build the Data Frame
students <- data.frame(
  Reg.No = Reg.No,
  Name = Name,
  Programme = Programme,
  Specialization = Specialization,
  Subject1 = Subject1,
  Subject2 = Subject2,
  Subject3 = Subject3,
  Subject4 = Subject4,
  Subject3_Marks = Subject3_Marks,
  stringsAsFactors = FALSE
)

# Print structure and first 6 rows
str(students)
head(students)

# Step 3: Add Computed Columns (Sum & Average)
# Vectorized row summation over the four subject columns
students$Sum <- rowSums(students[, c("Subject1","Subject2","Subject3","Subject4")])
students$Average <- students$Sum / 4

# Step 4: Derive Rank Based on Sum
# Using negative Sum so highest value gets rank 1
students$Rank <- rank(-students$Sum, ties.method = "min")

# Step 5: Output Requirements
print("--- Complete Data Frame ---")
print(students)

# Sort by Rank (ascending)
students_by_rank <- students[order(students$Rank), ]

print("--- Data Frame Sorted by Rank ---")
print(students_by_rank)



# Program 2
# Step 1: Create Column Vectors
PatientID <- c("HOS1001", "HOS1002", "HOS1003", "HOS1004", "HOS1005", 
               "HOS1006", "HOS1007", "HOS1008", "HOS1009", "HOS1010")
Name <- c("Arjun Menon", "Bhavana Iyer", "Chirag Gupta", "Devika Nair", "Eshwar Rao", 
          "Farida Sheikh", "Gaurav Kumar", "Harini Krishnan", "Ishita S", "Jatin Verma")
Department <- c("Cardiology", "Neurology", "Endocrinology", "Pulmonology", "Cardiology", 
                "Endocrinology", "Neurology", "Pulmonology", "Cardiology", "Endocrinology")
Diagnosis <- c("Hypertension", "Migraine", "Type-2 Diabetes", "Asthma", "Hypertension", 
               "Thyroid Disorder", "Epilepsy", "COPD", "Arrhythmia", "Type-1 Diabetes")

Test1 <- c(82, 71, 90, 64, 95, 60, 78, 68, 87, 83)
Test2 <- c(76, 69, 92, 70, 94, 63, 82, 72, 85, 79)
Test3 <- c(88, 73, 86, 67, 93, 61, 79, 70, 90, 77)
Test4 <- c(84, 75, 91, 72, 96, 66, 81, 69, 88, 85)
Test3_Score <- Test3  # Duplicate of Test3 as per instructions

# Step 2: Build the Data Frame
patients <- data.frame(
  PatientID, Name, Department, Diagnosis, 
  Test1, Test2, Test3, Test4, Test3_Score, 
  stringsAsFactors = FALSE
)

print("--- Structure of patients Data Frame ---")
str(patients)
print("--- Head of patients Data Frame ---")
head(patients)

# Step 3: Patient-Level Sum, Average, Rank
test_cols <- c("Test1", "Test2", "Test3", "Test4")
patients$Sum <- rowSums(patients[, test_cols])
patients$Average <- round(patients$Sum / 4, 2)

# Tie Strategy: Using "min" method assigns the lowest valid rank to identical sums (e.g., tied for 1st get rank 1).
patients$Rank <- rank(-patients$Sum, ties.method = "min")

print("--- Data Frame Sorted by Rank (Ascending) ---")
patients_sorted <- patients[order(patients$Rank), ]
print(patients_sorted)

# Step 4: Test-Wise Average (Overall)
test_wise_avg <- colMeans(patients[, test_cols], na.rm = TRUE)
print("--- Overall Average per Diagnostic Test ---")
print(round(test_wise_avg, 2))

# Step 5: Department-Wise Averages (Per Test + Overall)
dept_test_avg <- aggregate(
  patients[, test_cols],
  by = list(Department = patients$Department),
  FUN = function(x) round(mean(x, na.rm = TRUE), 2)
)

# Add Overall_Average across the 4 tests for each department
dept_test_avg$Overall_Average <- round(rowMeans(dept_test_avg[, test_cols], na.rm = TRUE), 2)

# Sort the department summary by Overall_Average descending
dept_test_avg <- dept_test_avg[order(-dept_test_avg$Overall_Average), ]

print("--- Department-Wise Averages ---")
print(dept_test_avg)