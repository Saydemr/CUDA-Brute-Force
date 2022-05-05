#include <iostream>
#include <fstream>
#include <string>
#include <cstdio>
#include <stdlib.h>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

using namespace std;


__device__ __host__ std::pair<uint64_t,uint64_t> strtouint64(auto* password_text){
	uint64_t uword1 = 0;
	uint64_t uword2 = 0;
	// uint64_t uword3 = 0;
	auto password_str = std::string(password_text);
	
	for(int i = 0; i < password_str.length(); i++)
	{
		uint8_t uchar = (uint8_t) (int) password_str[i];
		if (i < 8) 
		{
			uword1 = (uword1 << 8) | uchar;
		}
		else
		{
			uword2 = (uword2 << 8) | uchar;
		}
	}
	return {uword1,uword2};
}
