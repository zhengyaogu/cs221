#include <iostream>

using namespace std;

bool isMultiple(int mult, int base){
	if(mult % base == 0){
		return true;
	}
	return false;
}

int main(){
	int num = 0;
	cin >> num;

	int reading = 0;
	int sum = 0;
	for(int i = 0; i < 10; ++i){
		cin >> reading;
		if(isMultiple(reading, num)){
			++sum;
		}
	}
	cout << sum;

	return 0;
}