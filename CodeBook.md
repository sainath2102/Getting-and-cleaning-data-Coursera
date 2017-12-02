# Introduction

The script `run_analysis.R` returns the tidy data from the dataset.

# Variables used to clean up the data

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the original data.

* `x_total`, `y_total` and `subject_total` are the merged datasets.

* `features` contains the correct names for the `x_data` dataset and `activitives` contain the names of the activities.

* `total_data` is obtained by merging `x_data`, `y_data` and `subject_data`.

* The tidy data is stored in the file names `tidydata.txt`.