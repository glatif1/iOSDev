//
//  main.swift
//  Playground
//
//  Created by Ghufran Latif  on 11/11/20.
//

import Foundation

print("SORTING ALGORITHMS")

// Merge Sort
func mergeSort(array: inout [Int], l: Int, r: Int){
    if(l < r) {
        let mid = (l+r)/2
        mergeSort(array: &array, l: l, r: mid)
        mergeSort(array: &array, l: mid+1, r: r)
        merge(array: &array, l: l, mid: mid, r: r)
    }
}

func merge(array: inout [Int], l: Int, mid: Int, r: Int){
    //get sizes of subarrays
    let size1 = mid - l + 1
    let size2 = r - mid

    //create temp sub arrays
    var L = [Int](repeating: 0, count: size1)
    var R = [Int]( repeating: 0, count: size2)
    
    //Copy sub arrays
    for i in 0...size1-1{
        L[i] = array[i + l]
    }
    for j in 0...size2-1{
        R[j] = array[j + mid+1]
    }
    
    //merge the two sub arrays by comparing elements
    var i = 0 // left sub array
    var j = 0 // right sub array
    var k = l // index for the main array
    while(i < size1 && j < size2){
        if(L[i] <= R[j]){
            array[k] = L[i]
            i+=1
        }else{
            array[k] = R[j]
            j+=1
        }
        k+=1
    }
    //merge the rest of the arrays
    while(i < size1){
        array[k] = L[i]
        i+=1
        k+=1
    }
    while(j < size2){
        array[k] = R[j]
        j+=1
        k+=1
    }
}
print("--Merge Sort--")
var array: [Int] = [1,8,5,3,6]
print("Original Array\n \(array)")
mergeSort(array: &array, l: 0, r: array.count-1)
print("Sorted Array\n \(array) \n")


func heapSort (_ array: inout [Int]) {
    //get length of array
    let n = array.count //6
    
    //Build heap by re arranging the array
    for i in (0...((n/2)-1)).reversed() { //for i = 3 to 0
        heapify(&array, n, i) //n = 6 ,i = 2
    }
    
    //1 by 1 extract elements from the heap and re heapify the heap each time
    for i in (0...(n-1)).reversed(){
        let temp = array[0]
        array[0] = array[i]
        array[i] = temp
        
        //re heapify the smaller array
        heapify(&array, i, 0);
    }
}

func heapify(_ array: inout [Int] , _ n: Int, _ i: Int){
    //Assume largest value is i and set it's children
    var largest = i // largest = 2
    let l = 2*i + 1 //l = 5
    let r = 2*i + 2 //r = 6 (index's)
    
    //if left is bigger than parent set as parent
    if l < n && array[l] > array[largest] { // 8 > 5
        largest = l // largest = 5
    }
    
    //if right is bigger then set right as largest
    if r < n && array[r] > array[largest]{
        largest = r
    }
    
    //if any of the previous cases fell through then swap values
    if(largest != i){
        let swap = array[i] //swap = 5 , array[2] = 5
        array[i] = array[largest] //array[2] = 8
        array[largest] = swap
    }
}

print("--Heap Sort--")
var arr = [1,9,5,4,7,8] //6
print("Original Array\n \(arr)")
heapSort(&arr)
print("Sorted Array\n \(arr)\n")


func quickSort(_ array: inout [Int], _ low: Int, _ high: Int) {
    if low < high{
        let pi = partition(&array, low, high)
        quickSort(&array, low, pi-1)
        quickSort(&array, pi+1, high)
    }
}


func partition(_ array: inout [Int], _ low: Int, _ high: Int) -> Int{
    //Take last element as the pivot (optional you can take other elements)
    let pivot = array[high-1]
    
    //get index of low
    var i = low - 1
    
    //iterate from low to high swapping each element
    for j in low...high-1 {
        //compare each element with the pivot and swap
        if array[j] < pivot {
            //i keeps track of the min
            i+=1
            //swap the elements
            let temp = array[i]
            array[i] = array[j]
            array[j] = temp
        }
    }
    
    //swap last element
    let temp = array[i+1]
    array[i+1] = array[high-1]
    array[high-1] = temp
    return i+1
}


print("--Quick Sort--")
var array1 = [1,9,5,4,7,8]
print("Original Array\n \(array1)")
quickSort(&array1, 0, array1.count)
print("Sorted Array\n \(array1)\n")





func binarySearch(_ array: [Int], _ l: Int, _ r: Int, _ n: Int) -> Int{
    let mid = (l+r) / 2
    if l < r {
        
        if array[mid] == n {
            return mid
        }
        if array[mid] > n { //go left if the value is bigger
            return binarySearch(array, l, mid-1, n)
        }
        if array[mid] < n{//go right if the value is smaller
            return binarySearch(array, mid+1, r, n)
        }
    }
    return -1
}


print("Binary Search")
print("Found at ", binarySearch(array1, 0, array1.count-1, 5))




























