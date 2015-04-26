# Check that the required packages are present and install them if not available
setup.packages <- function() {
	if(require("downloader")){
  		print("downloader is loaded correctly")
	} else {
  		print("trying to install downloader")
  		install.packages("downloader")
  		if(require(downloader)){
    			print("downloader installed and loaded")
  		} else {
    			stop("could not install required package (downloader)")
  		}
	}

	if(require("plyr")){
		print("plyr is loaded correctly")
	} else {
  		print("trying to install plyr")
  		install.packages("plyr")
  		if(require(plyr)){
    			print("plyr installed and loaded")
  		} else {
    			stop("could not install required package (plyr)")
		}
	}
}

# Download and unzip the source dataset
prepare.raw.data <- function() {
	if (file.exists('data')) {
		setwd(file.path(getwd(), 'data'))
	} else {
		dir.create(file.path(getwd(), 'data'))
		setwd(file.path(getwd(), 'data'))
	}

	url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
	file <- 'UCI HAR Dataset.zip'
	
	if (!file.exists(file)) {
		download(url, file)
	}

        unzip(file)
	
	if (file.exists('UCI HAR Dataset')) {
		setwd(file.path(getwd(), 'UCI HAR Dataset'))
	} else {
		stop("expected data directory not found (data/UCI HAR Dataset)")
	}
}

process.raw.data <- function() {
	# Step 1
	# Merges the training and the test sets to create one data set

	x.train <- read.table("train/X_train.txt")
	y.train <- read.table("train/y_train.txt")
	subject.train <- read.table("train/subject_train.txt")

	x.test <- read.table("test/X_test.txt")
	y.test <- read.table("test/y_test.txt")
	subject.test <- read.table("test/subject_test.txt")

	# create 'x' data set
	x.data <- rbind(x.train, x.test)

	# create 'y' data set
	y.data <- rbind(y.train, y.test)

	# create 'subject' data set
	subject.data <- rbind(subject.train, subject.test)

	# Step 2
	# Extracts only the measurements on the mean and standard deviation for each measurement
	features <- read.table("features.txt")

	# get only columns with mean() or std() in their names
	mean.and.std.features <- grep("-(mean|std)\\(\\)", features[, 2])

	# subset the desired columns
	x.data <- x.data[, mean.and.std.features]

	# correct the column names
	names(x.data) <- features[mean.and.std.features, 2]

	# Step 3
	# Uses descriptive activity names to name the activities in the data set
	activities <- read.table("activity_labels.txt")

	# update values with correct activity names
	y.data[, 1] <- activities[y.data[, 1], 2]

	# correct column name (v1 -> activity)
	names(y.data) <- "activity"

	# Step 4
	# Appropriately labels the data set with descriptive variable names
	
	# correct column name
	names(subject.data) <- "subject"

	# bind all the data in a single data set
	merged.data <- cbind(x.data, y.data, subject.data)

	# tidy variable names
	tidy.dt.names <- names(merged.data)
	tidy.dt.names <- gsub('-mean', 'Mean', tidy.dt.names)
	tidy.dt.names <- gsub('-std', 'Std', tidy.dt.names)
	tidy.dt.names <- gsub('[()-]', '', tidy.dt.names)
	tidy.dt.names <- gsub('BodyBody', 'Body', tidy.dt.names)
	names(merged.data) <- tidy.dt.names

	# Step 5
	# Create a second, independent tidy data set with the average of each variable for each activity and each subject

	# 66 <- 68 columns but last two (activity & subject)
	averages.data <- ddply(merged.data, .(subject, activity), function(x) colMeans(x[, 1:66]))
	
	write.table(averages.data, "../../averages_data.txt", row.name=FALSE)
}

clean.files <- function() {
	#file.rename(from = 'averages_data.txt',
      #            to = '../../averages_data.txt')
	setwd(file.path(getwd(), '../..'))
	print(getwd())
	unlink('./data/UCI HAR Dataset', recursive = TRUE)
}

process.data <- function() {
	setup.packages()
	prepare.raw.data()
	process.raw.data()
	clean.files()
}