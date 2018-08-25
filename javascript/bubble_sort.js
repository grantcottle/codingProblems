
const bubbleSort = (nums) => {
    do {
        var swapped = false;
        for (var i = 0, l = nums.length; i < l; i++) {
            snapshot(nums);
            if (nums[i] > nums[i+1]) {
                var temp = nums[i];
                nums[i] = nums[i+1];
                nums[i+1] = temp;
                swapped = true;
            }
        }
    } while(swapped);
    snapshot(nums)
};

const snapshot = (nums) => {
    console.log(nums);
}

let numbers = [9,5,8,10,4,2,6,2,1,3]

bubbleSort(numbers);


