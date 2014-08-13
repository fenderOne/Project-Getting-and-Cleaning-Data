Project: Getting and Cleanning Data
=================================== 
Intro
-----

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The data used for this assigment is data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
>[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones][1]

Here are the data for the project: 

>[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip][2]

Data to work with
-----------------
The former link gives us a zip file that when unzipped will show a directory structure with a lot of data files as follow:

>**/UCI HAR Dataset**  
>>**/train**  
>>>/Inertial Signals  
*y_train.txt*  
*X_train.txt*  
*subject_train*  

>>**/test**  
>>>/Inertial Signals  
*y_train.txt*  
*X_train.txt*  
*subject_train* 

>README.txt  
*features_info.txt*  
*features.txt*  
*activity_labels*  

The README.txt include info about all of these files.

The *run_analysis.R* script
---------------------------  
This is the script to run to obtain the output:

```
> source("run_analysis.R")
```  

After running the script you have:
1. The object 'tidyDataSet' in the R global environment
2. The file 'tidyDataSet.txt' on the working directory

For a definition of the variables involved in the result set look up the *CodeBook.md* file.  

### How this script works
 1. If the default directory for the dataset ("./UCI HAR Dataset") is not in the working directory, the script dowload the zip file from the Internet and unzip it generating the structure described before. If the zip  file is already unzipped in the working directory the script will use it.
 2. Read the variables names from the feature.txt file
 3. 
Dillinger uses a number of open source projects to work properly:

* [Ace Editor] - awesome web-based text editor
* [Marked] - a super fast port of Markdown to JavaScript
* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [node.js] - evented I/O for the backend
* [Express] - fast node.js network app framework [@tjholowaychuk]
* [keymaster.js] - awesome keyboard handler lib by [@thomasfuchs]
* [jQuery] - duh 

Installation
--------------

```sh
git clone [git-repo-url] dillinger
cd dillinger
npm i -d
mkdir -p public/files/{md,html,pdf}
```

##### Configure Plugins. Instructions in following README.md files

* plugins/dropbox/README.md
* plugins/github/README.md
* plugins/googledrive/README.md

```sh
node app
```


License
----

MIT


**Free Software, Hell Yeah!**

[1]:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[2]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
[1]:http://daringfireball.net/projects/markdown/
[marked]:https://github.com/chjj/marked
[Ace Editor]:http://ace.ajax.org
[node.js]:http://nodejs.org
[Twitter Bootstrap]:http://twitter.github.com/bootstrap/
[keymaster.js]:https://github.com/madrobby/keymaster
[jQuery]:http://jquery.com
[@tjholowaychuk]:http://twitter.com/tjholowaychuk
[express]:http://expressjs.com
