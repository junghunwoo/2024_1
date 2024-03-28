#include <iostream>
#include <fstream>
#include <cmath>
using namespace std;
const float PI = 3.141592;

int main() {
	float t = 0.0, dt, T;
	cout << "range of t : ";
	cin >> T;
	cout << "dt : ";
	cin >> dt;

	ofstream text0;
	text0.open("hw4_1.txt");
	if (!text0) return 0;
	for (t = 0.0; t < T; t += dt) {
		text0 << t
			<< " " << 100 * cos(20. * PI * t) * cos(220. * PI * t)
			<< " " << 60 * sin(240. * PI * t) + 80 * sin(220. * PI * t) << endl;
	}
	text0.close();
	return 1;
}

