#include <iostream>

using namespace std;

int main(){
	int one = 0;
	int two = 0;
	int three = 0;

	cin >> one;
	cin >> two;
	cin >> three;

	if(one > two){
		if(one > three){
			cout << one;
		}
		else{
			cout << three;
		}
	}
	else{
		if(two > three){
			cout << two;
		}
		else{
			cout << three;
		}
	}

	return 0;
}