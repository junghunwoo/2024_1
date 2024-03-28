#include <fstream>  // text out ofstream
#include <iostream>
#include <cmath>    // sin
using namespace std;
const float PI = 3.141592;  // define
int main() {
	float t = 0.0, dt, T, a, b, r1, r2; // r1,r2는 cos,sin함수 각각에 곱해지는 상수, a,b는 cos,sin 함수의 주파수에 곱해지는 상수
	dt = 1. / 440. / 20.;
	T = 5. / 440.;
	cout << "Inter a,b,r1,r2" << endl;
	cin >> a >> b >> r1 >> r2;
	ofstream Making("Result.txt");
	for (t = 0.0; t < T; t += dt) {
		Making << t << "    " << r1 * cos(a * PI * 440 * t) << "    " << r2 * sin(b * PI * 440 * t) << endl;
	}
	Making.close();
	return 123;
}
