#include <stdio.h>

//onCPU
void onCPU() 
{
	printf("This is running on CPU\n");
}

//Kernel runs on GPU
__global__ void onGPU()
{
	//keeps track of thread Index of the block
	int i = threadIdx.x;
	printf("This is running on GPU with the treadIndex of %d\n",&i);
}

int main() 
{
	//1 block/grid,  runs 5 threads/block
	onGPU<<<1, 5>>>();
	//Waits for GPU to finish 
	cudaDeviceSynchronize();
	//runs on CPU normal c++ execution
	onCPU();
}
