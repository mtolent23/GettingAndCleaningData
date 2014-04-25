## CodeBook

The run_analysis.R script performs the following to clean up the data:

<ul>
<li><p>Merges the training and test sets to create one data set</p>
<p>The result is in the data frame: <b>merged_data</b> (10299 rows, 563 columns)</p>
</li>
<li>
<p>Extracts only the measurements on the mean and standard deviation for each measurement</p>
<p>The result is in the data frame: <b>reduced_data</b> (10299 rows, 66 columns)</p>
</li>
<li>
<p>Uses descriptive activity names to name the activities in the data set</p>
<p>The result is in the data frame: <b>activity_labels</b> (6 rows, 2 columns) where values of ActivityName are
walking, walkingupstairs, walkingdownstairs, sitting, standing and laying</p>
</li>
<li>
<p>Appropriately labels the data set with descriptive activity names</p>
<p>The result is in the data frame: <b>merged_reduced_labeled_data</b> (10299 rows, 67 columns)</p>
</li>
<li>
<p>Appropriately labels the data set with descriptive activity names</p>
<p>The result is in the data frame: <b>merged_reduced_labeled_data</b> (10299 rows, 67 columns)</p>
<p>The data frame <b>merged_reduced_labeled_data</b> is stored in the file \"merged_clean_data.txt\"</p>
</li>
<li>
<p>Creates independent tidy data set with the average of each variable for each activity and each subject</p>
<p>The result is in the data frame: <b>tidy_data</b> (180 rows, 66 columns)</p>
<p>The data frame <b>tidy_data</b> is stored in the file \"tidy.txt\"</p>
</li>
</ul>
