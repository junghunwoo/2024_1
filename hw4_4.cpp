#include <iostream>
#include <fstream>
using namespace std;
int main() {
    float t = 0, dt, T = 0.05, ss, n;
    cout << "n : ";
    cin >> n;
    dt = 1. / 400. / n;
    int i = 0;
    ofstream xx;
    xx.open("result4_4.txt");
    if (!xx) return -1;
    for (t = 0; t < T; t += dt, i++) {
        ss = sin(2 * 3.141592 * 400 * t);
        xx << t << " " << ss << endl;
    }
    xx.close();
    return 1;
}