#include <iostream>

using namespace std;


int log(int num, int base){
	if(num < base){
		return 0;
	}
	return 1 + log(num / base, base);
}


int main(){
	int num = 0;
	int base = 0;

	cin >> num;
	cin >> base;

	if(num < 0 || base < 0){
		cout << "Both inputs must be non-negative";
		return 1;
	}

	cout << log(num, base);

	return 0;
}