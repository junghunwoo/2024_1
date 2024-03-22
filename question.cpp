#include <iostream>
using namespace std;
// differentiation about (u*cos(v*x))
void difAboutCos(float x, float dx) {
	float num, anal;
	anal = -2 * sin(x);
	num = ((2 * cos(x + dx)) - 2 * cos(x)) / dx;
	cout << "num " << num << " anal " << anal << endl;
	cout << "error = " << (num - anal) / anal * 100 << "%\n";
}


void main() {
	float x, dx, num, anal;
	cout << "x dx ? = ";
	cin >> x >> dx;
	difAboutCos(x, dx);
}