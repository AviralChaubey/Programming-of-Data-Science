# Program 1
## ------------------------------------------------------------
## Retail Branch Sales Analytics — CSV Workflow (Base R only)
## ------------------------------------------------------------

## 0) File names
input_csv         <- "branches_input.csv"
branches_rank_csv <- "branches_by_rank.csv"
quarter_avg_csv   <- "quarter_wise_averages.csv"
region_avg_csv    <- "region_wise_averages.csv"

## 1) Create vectors from the table
BranchID   <- c("BR001","BR002","BR003","BR004","BR005","BR006","BR007","BR008","BR009","BR010")
BranchName <- c("Vellore Town","Chennai Central","Mumbai Andheri","Pune Hinjewadi","Delhi Karol Bagh",
                "Noida Sector 18","Kolkata Park St","Hyderabad Hitech","Ahmedabad CG Rd","Jaipur MI Road")
Region     <- c("South","South","West","West","North","North","East","South","West","North")
Segment    <- c("Grocery","Electronics","Grocery","Home","Apparel","Electronics","Grocery","Home","Apparel","Home")

Q1 <- c(120,140,110,95,150,132,105,128,115,108)
Q2 <- c(115,150,118,100,142,138,107,131,120,112)
Q3 <- c(130,145,122,108,155,136,112,134,125,118)
Q4 <- c(125,160,120,112,158,140,115,137,129,121)
Q3_Sales <- Q3  # verification column

## 2) Create data frame and write input CSV
branches <- data.frame(
  BranchID, BranchName, Region, Segment,
  Q1, Q2, Q3, Q4, Q3_Sales,
  stringsAsFactors = FALSE
)
write.csv(branches, file = input_csv, row.names = FALSE, na = "")
cat("Input CSV written:", normalizePath(input_csv, winslash = "/"), "\n")

## 3) Read input CSV for analytics
branches_in <- read.csv(input_csv, stringsAsFactors = FALSE, check.names = TRUE)
str(branches_in)

## Validation and typing
quarter_cols  <- c("Q1","Q2","Q3","Q4")
required_cols <- c("BranchID","BranchName","Region","Segment", quarter_cols, "Q3_Sales")
missing <- setdiff(required_cols, names(branches_in))
if (length(missing) > 0) stop("Missing columns: ", paste(missing, collapse = ", "))
for (cn in quarter_cols) if (!is.numeric(branches_in[[cn]])) branches_in[[cn]] <- as.numeric(branches_in[[cn]])
stopifnot(all(sapply(branches_in[quarter_cols], is.numeric)))

## 4) Per-branch analytics (Sum, Average, Rank)
branches_in$Sum     <- rowSums(branches_in[ , quarter_cols], na.rm = TRUE)
branches_in$Average <- branches_in$Sum / length(quarter_cols)
branches_in$Rank    <- rank(-branches_in$Sum, ties.method = "min")
branches_by_rank    <- branches_in[order(branches_in$Rank, branches_in$BranchID), ]
write.csv(branches_by_rank, file = branches_rank_csv, row.names = FALSE, na = "")
cat("Branches by rank CSV:", normalizePath(branches_rank_csv, winslash = "/"), "\n")

## 5) Quarter-wise averages
quarter_wise_avg <- colMeans(branches_in[ , quarter_cols], na.rm = TRUE)
quarter_avg_df   <- data.frame(Quarter = names(quarter_wise_avg),
                               Average = as.numeric(quarter_wise_avg),
                               stringsAsFactors = FALSE)
write.csv(quarter_avg_df, file = quarter_avg_csv, row.names = FALSE, na = "")
cat("Quarter-wise averages CSV:", normalizePath(quarter_avg_csv, winslash = "/"), "\n")

## 6) Region-wise averages (per quarter + overall)
region_quarter_avg <- aggregate(
  branches_in[ , quarter_cols],
  by = list(Region = branches_in$Region),
  FUN = function(x) mean(x, na.rm = TRUE)
)
region_quarter_avg$Overall_Average <- rowMeans(region_quarter_avg[ , quarter_cols], na.rm = TRUE)
region_quarter_avg <- region_quarter_avg[order(-region_quarter_avg$Overall_Average, region_quarter_avg$Region), ]
write.csv(region_quarter_avg, file = region_avg_csv, row.names = FALSE, na = "")
cat("Region-wise averages CSV:", normalizePath(region_avg_csv, winslash = "/"), "\n")



# Program 2
## ------------------------------------------------------------
## Student Marks Analytics — CSV Workflow (Base R only)
## ------------------------------------------------------------

## 0) File names
input_csv        <- "students_input.csv"
students_rank_csv <- "students_by_rank.csv"
assess_avg_csv   <- "assessment_wise_averages.csv"
spec_avg_csv     <- "specialization_wise_averages.csv"

## 1) Create vectors from the table
RegNo <- c("24BCE1001", "24BCE1002", "24BCE1003", "24BCE1004", "24BCE1005",
           "24BCE1006", "24BCE1007", "24BCE1008", "24BCE1009", "24BCE1010")
Name <- c("Aadesh Kumar", "Bhavya Reddy", "Charan Iyer", "Divya Sharma", "Esha Nair",
          "Farhan Khan", "Gayathri Raj", "Harish Kumar", "Ishita Menon", "Jai Verma")
Programme <- rep("B.Tech", 10)
Specialization <- c("CSE", "AI", "DS", "IT", "CSE", "ECE", "Cyber", "AI", "DS", "IT")

Assess1 <- c(18, 15, 20, 14, 20, 12, 17, 16, 19, 18)
Assess2 <- c(17, 16, 19, 15, 20, 14, 18, 17, 18, 17)
Assess3 <- c(19, 14, 18, 15, 19, 13, 17, 16, 19, 16)
Assess4 <- c(18, 18, 20, 16, 20, 16, 19, 15, 18, 19)

## Combine into data frame
students <- data.frame(
  RegNo, Name, Programme, Specialization,
  Assess1, Assess2, Assess3, Assess4,
  stringsAsFactors = FALSE
)

print("--- Structure of students Data Frame ---")
str(students)
print("--- Head of students Data Frame ---")
print(head(students))

## 2) Write Input CSV
write.csv(students, file = input_csv, row.names = FALSE, na = "")
cat("Input CSV written:", normalizePath(input_csv, winslash = "/", mustWork = FALSE), "\n")

## 3) Read from CSV for Analytics
students_in <- read.csv(input_csv, stringsAsFactors = FALSE, check.names = TRUE)

## Validation and typing
assess_cols   <- c("Assess1", "Assess2", "Assess3", "Assess4")
required_cols <- c("RegNo", "Name", "Programme", "Specialization", assess_cols)
missing <- setdiff(required_cols, names(students_in))
if (length(missing) > 0) stop("Missing columns: ", paste(missing, collapse = ", "))

for (cn in assess_cols) {
  if (!is.numeric(students_in[[cn]])) students_in[[cn]] <- as.numeric(students_in[[cn]])
}
stopifnot(all(sapply(students_in[assess_cols], is.numeric)))

## 4) Per-Student Analytics (Sum, Average, Rank)
students_in$Total   <- rowSums(students_in[ , assess_cols], na.rm = TRUE)
students_in$Average <- students_in$Total / length(assess_cols)
students_in$Rank    <- rank(-students_in$Total, ties.method = "min")

# Sort ascending by Rank, then by RegNo for ties
students_by_rank <- students_in[order(students_in$Rank, students_in$RegNo), ]
write.csv(students_by_rank, file = students_rank_csv, row.names = FALSE, na = "")
cat("Students by rank CSV written:", normalizePath(students_rank_csv, winslash = "/", mustWork = FALSE), "\n")

## 5) Assessment-Wise Averages
assess_wise_avg <- colMeans(students_in[ , assess_cols], na.rm = TRUE)
assess_avg_df   <- data.frame(Assessment = names(assess_wise_avg),
                              Average = as.numeric(assess_wise_avg),
                              stringsAsFactors = FALSE)
write.csv(assess_avg_df, file = assess_avg_csv, row.names = FALSE, na = "")
cat("Assessment-wise averages CSV written:", normalizePath(assess_avg_csv, winslash = "/", mustWork = FALSE), "\n")

## 6) Specialization-Wise Averages (per assessment + overall)
spec_avg <- aggregate(
  students_in[ , assess_cols],
  by = list(Specialization = students_in$Specialization),
  FUN = function(x) mean(x, na.rm = TRUE)
)
spec_avg$Overall_Average <- rowMeans(spec_avg[ , assess_cols], na.rm = TRUE)
spec_avg <- spec_avg[order(-spec_avg$Overall_Average, spec_avg$Specialization), ]

write.csv(spec_avg, file = spec_avg_csv, row.names = FALSE, na = "")
cat("Specialization-wise averages CSV written:", normalizePath(spec_avg_csv, winslash = "/", mustWork = FALSE), "\n")