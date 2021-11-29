#include <stdio.h>

// поиск x, в массиве arr, размера s
int binsearch(int x, int arr[], int s);

int main(){
    int arr[] = {1,2,3,5,6,10,12,15,20};
    int x = 10;
    int arr_size = (int)(sizeof(arr)/sizeof(arr[0]));
    int result = binsearch(x, arr, arr_size);
    printf("%d", result);
    return 0;
}

int binsearch(int x, int arr[], int s){
    int low, high, mid;
    low = 0;
    high = s - 1;

    while ( low <= high ){
        mid = (low+high)/2; // 4, 6, 5
        printf("low = %d; high = %d; mid = %d;\n", low, high, mid);

        if ( x < arr[mid] ){ // f, t, f
            high = mid - 1; // , 5
        } else if ( x > arr[mid] ){ // t, f, 
            low = mid + 1; // 5, 
        } else {
            return mid; // t
        }
    }
    return -1;
}