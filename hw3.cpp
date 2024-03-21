#include <iostream>
using namespace std;
// differentiation about (u*cos(v*x))
void difAboutCos(float u, float v, float x, float dx) {
	float num, anal;
	anal = -u * v * sin(v * x);
	num = ((u * cos(v * (x + dx))) - u * cos(v * x)) / dx;
	cout << "num " << num << " anal " << anal << endl;
	cout << "error = " << (num - anal) / anal * 100 << "%\n";
}

// integration about (u*cos(v*x))
void intAboutCos(float u, float v, float a, float b, int N) {
	float dx, num, anal;
	anal = (u / v * sin(v * b)) - (u / v * sin(v * a));
	dx = (b - a) / N;
	num = 0;
	for (int i = 0; i < N; i++) {
		num += (u * cos(v * (a + i * dx))) * dx;
	}
	cout << "num " << num << " anal " << anal << endl;
	cout << "error = " << (num - anal) / anal * 100 << "%\n";
}

// differentiation about t*log(s*x)
void difAboutLog(float t, float s, float x, float dx) {
	float num, anal;
	anal = t / x;
	num = ((t * log(s * (x + dx))) - t * log(s * x)) / dx;
	cout << "num " << num << " anal " << anal << endl;
	cout << "error = " << (num - anal) / anal * 100 << "%\n";
}

// integration about t*log(s*x)
void intAboutLog(float t, float s, float a, float b, int N) {
	float dx, num, anal;
	anal = (t * b * log(s * b) - t * b) - (t * a * log(s * a) - t * a);
	dx = (b - a) / N;
	num = 0;
	for (int i = 0; i < N; i++) {
		num += t * log(s * (a + dx * i)) * dx;
	}
	cout << "num " << num << " anal " << anal << endl;
	cout << "error = " << (num - anal) / anal * 100 << "%\n";
}

// differentiation about (px^2 + qx + r)
void difAboutQuaFunc(float p, float q, float r, float x, float dx) {
	float num, anal;
	anal = 2 * p * x + q;
	num = ((p * (x + dx) * (x + dx) + q * (x + dx) + r) - (p * x * x + q * x + r)) / dx;
	cout << "num " << num << " anal " << anal << endl;
	cout << "error = " << (num - anal) / anal * 100 << "%\n";
}

// integration about (px*x + qx + r)
void intAboutQuaFunc(float p, float q, float r, float a, float b, int N) {
	float dx, num, anal;
	anal = (p / 3 * b * b * b + q / 2 * b * b + r * b) - (p / 3 * a * a * a + q / 2 * a * a + r * a);
	dx = (b - a) / N;
	num = 0;
	for (int i = 0; i < N; i++) {
		num += (p * (a + dx * i) * (a + dx * i) + q * (a + dx * i) + r) * dx;
	}
	cout << "num " << num << " anal " << anal << endl;
	cout << "error = " << (num - anal) / anal * 100 << "%\n";
}

// differentiation about (1/(x - p))
void difAboutFraFunc(float p, float x, float dx) {
	float num, anal;
	anal = -1 / ((x - p) * (x - p));
	num = (1 / (x + dx - p) - 1 / (x - p)) / dx;
	cout << "num " << num << " anal " << anal << endl;
	cout << "error = " << (num - anal) / anal * 100 << "%\n";
}

// integration about (1/(x-p))
void intAboutFraFunc(float p, float a, float b, int N) {
	float dx, num, anal;
	anal = log(b - p) - log(a - p);
	dx = (b - a) / N;
	num = 0;
	for (int i = 1; i < N+1; i++) {
		num += 1 / (a + dx * i - p) * dx;
	}
	cout << "num " << num << " anal " << anal << endl;
	cout << "error = " << (num - anal) / anal * 100 << "%\n";
}

//Main
void main() {
	float u, v, t, s, p, q, r, x, dx, num, anal, a, b;
	int N;
	//Cos 연산
	cout << "u * cos(v * x)" << endl;
	cout << "u v ? = ";
	cin >> u >> v;
	cout << "x dx ? = ";
	cin >> x >> dx;
	difAboutCos(u, v, x, dx);
	cout << "a b N ? = ";
	cin >> a >> b >> N;
	intAboutCos(u, v, a, b, N);
	//Log 연산
	cout << "t*log(s*x)" << endl;
	cout << "t s ? = ";
	cin >> t >> s;
	cout << "x dx ? = ";
	cin >> x >> dx;
	difAboutLog(t, s, x, dx);
	cout << "a b N ? = ";
	cin >> a >> b >> N;
	intAboutLog(t, s, a, b, N);
	//이차함수 연산
	cout << "px^2 + qx + r" << endl;
	cout << "p q r ? = ";
	cin >> p >> q >> r;
	cout << "x dx ? = ";
	cin >> x >> dx;
	difAboutQuaFunc(p, q, r, x, dx);
	cout << "a b N ? = ";
	cin >> a >> b >> N;
	intAboutQuaFunc(p, q, r, a, b, N);
	// 1/(x-p) 연산
	cout << "1/(x-p)" << endl;
	cout << "p = ";
	cin >> p;
	cout << "x dx ? = ";
	cin >> x >> dx;
	difAboutFraFunc(p, x, dx);
	cout << "a b N ? = ";
	cin >> a >> b >> N;
	intAboutFraFunc(p, a, b, N);
}