#include <stdio.h>

void shell_sort( int arr[], int n );

int main(){

    // int arr[] = {4,8,6,2,3,5,1,54,21,456,7,90};
    // int arr[] = {1,2,3,4,5,6,7,8,9};
    int arr[] = {9,8,7,6,5,4,3,2,1};
    int arr_size = (int)(sizeof(arr)/sizeof(arr[0]));
    printf("%d\n", arr_size);
    shell_sort(arr, arr_size);
    printf("\n\n");
    for (int i = 0; i < arr_size; i++){
        printf("%d ", arr[i]);
    }

    return 0;
}

void shell_sort( int arr[], int n ){
    int gap, i, j, tmp;

    for( gap = n/2; gap > 0; gap /= 2 ){
        printf("\ngap = %d\t", gap);
        for( i = gap; i < n; i++ ){
            printf("\n\ti = %d\n", i);
            for ( j = i - gap; j >= 0 && arr[j] > arr[j+gap]; j -= gap ){
                printf("\t\tj = %d; %d <-> %d\n", j, arr[j], arr[j+gap]);
                tmp = arr[j];
                arr[j] = arr[j+gap];
                arr[j+gap] = tmp;
            }

            printf("\t\tarr = ");
            for (int k = 0; k < n; k++){
                printf("%d ", arr[k]);
            }
            printf("\n");
        }
    }
}