/*
 * function_vec_header.cpp
 *
 *  Created on: Oct 3, 2019
 *      Author: ramneet
 */

#include<iostream>
#include <stdio.h>
#include<vector>
using std::vector;
using std::cout;
using std::cin;
using std::endl;
#include"source/function_vec_header.h"
int main()
{
    int n;
    vector<int> arr1; //our container
       int fill; //our container content variable
       //invariant fill is the integer to be stored
       cout<<"Enter the number of elements: ";
       cin>>n;
       for (int j = 0; j != n; ++j)
       {
           cout<<"Enter your value ";
           cin>>fill;
           arr1.push_back(fill);
       }

       int result=func_largest_Num(arr1,n);
       cout << "Largest element is = " << result;
       cout<<endl;
      void func_bubble_sort(arr1,n);
      cout<<"After Bubble sort the array is:\n";
         for(int i=0;i<n;i++)
         cout<<arr1[i]<<" ";
}







