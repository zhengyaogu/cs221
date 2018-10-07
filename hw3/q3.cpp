#include <iostream>

using namespace std;

int pow(int base, int exponent){
	if(exponent == 0){
		return 1;
	}
	return base * pow(base, exponent - 1);
}

int main(){
	int base = 0;		//init user input
	int exponent = 0;

	cin >> base;		//read user inputs
	cin >> exponent;

	if (base < 1 || exponent < 1){
		cout << "Both inputs must be positive";
		return 1;
	}

	cout << pow(base, exponent); 	//print out power


	return 0;
}