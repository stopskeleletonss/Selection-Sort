String[] readvalues, splitvalues; //string arrays for reading the values from the csv file and for splitting the joined data from the csv file
String combinevalues; //string that combines the data from the csv file
int[] numvalues; //int array for switching the data from the csv file to numerical
int temp; //variable that temporarily holds a value in order for the two values being compared to switch
int selectednum; //variable that represents the first section in the array that is being compared to every section afterwards

void setup() {
  valuesetup();
  sortvalues();
  splitvalues = str(numvalues); //converts the numerical values in the splitvalues array back into strings
  saveStrings("random_numbers.csv", splitvalues); //saves the sorted data back into the csv file
}

void valuesetup() { //function to prepare the values from the csv file to be sorted
  readvalues = loadStrings("random_numbers.csv"); //loads the data from the file into the readvalues array
  combinevalues = join(readvalues, ","); //combines the values held in the readvalues array into one line
  splitvalues = split(combinevalues, ","); //splits the values held in the combinevalues array back into their own separate lines
  numvalues = int(splitvalues); //converts the strings held in the splitevalues array to numerical values
}

void sortvalues() { //function that sorts the values from least to greatest by comparing them to every value that comes after them in the array

  for (int index = 0; index < splitvalues.length-1; index++) { //index variable has an initial value of 0, must be less than the length of splitvalues array, and increases by increments of 1
    selectednum = index; //selectednum variable is equal to the value of index
    for (int index1 = index+1; index1 < splitvalues.length; index1++) { //index1 variable has an initial value of the index variable plus 1, must be less than the length of the splitvalues array, and increases by increments of 1
      if (numvalues[selectednum] > numvalues[index1]) { //if the selected value in the array is larger than another value in the array
        temp = (numvalues[selectednum]); //the value of the larger number is stored in the temp variable
        numvalues[selectednum] = numvalues[index1]; //the larger number moves to the position in the array that contained the smaller number
        numvalues[index1] = (temp); //the smaller number moves to the position in the array that contained the larger number
      }
    }
  }
}
